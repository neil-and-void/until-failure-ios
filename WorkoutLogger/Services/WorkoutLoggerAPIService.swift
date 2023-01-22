//
//  WorkoutLoggerAPIService.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-21.
//

import SwiftUI
import Apollo

protocol WorkoutLoggerAPIServiceProtocol {
    func getWorkoutRoutines(limit: Int, after: String?, withNetwork: Bool, completion: @escaping (Result<[WorkoutRoutine], APIError>) -> Void)
    func getWorkoutRoutine(withNetwork: Bool, workoutRoutineId: String, completion: @escaping (Result<WorkoutRoutine, APIError>) -> Void)
    func getWorkoutSessions(limit: Int, after: String?, withNetwork: Bool, completion: @escaping (Result<[WorkoutSession], APIError>) -> Void)
    func createWorkoutRoutine(name: String, completion: @escaping (Result<WorkoutLoggerAPI.CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, APIError>) -> Void)
    func updateWorkoutRoutine(_ workoutRoutine: WorkoutRoutine, completion: @escaping (Result<WorkoutRoutine, APIError>) -> Void)
    func deleteWorkoutRoutine(id: String, completion: @escaping (Result<Int, APIError>) -> Void)
    func addWorkoutSession(id: String, start: Date, completion: @escaping(Result<WorkoutSession, APIError>) -> Void)
    func getWorkoutSession(workoutSessionId: String, withNetwork: Bool, completion: @escaping (Result<WorkoutSession, APIError>) -> Void)
    func deleteWorkoutSession(id: String, completion: @escaping (Result<Int, APIError>) -> Void)
    func updateExercise(exerciseId: String, notes: String, completion: @escaping (Result<Exercise, APIError>) -> Void)
    func getExerciseRoutines(workoutRoutineId: String, withNetwork: Bool, completion: @escaping (Result<[ExerciseRoutine], APIError>) -> Void)
    func addExercise(workoutSessionId: String, exerciseRoutineId: String, completion: @escaping (Result<Exercise, APIError>) -> Void)
    func addSetEntry(exerciseId: String, setEntry: SetEntry, completion: @escaping (Result<SetEntry, APIError>) -> Void)
    func deleteExercise(exerciseId: String, completion: @escaping (Result<Int, APIError>) -> Void)
}

// extension that adds default values to protocol
extension WorkoutLoggerAPIServiceProtocol {
    func getWorkoutRoutine(withNetwork: Bool = false, workoutRoutineId: String, completion: @escaping (Result<WorkoutRoutine, APIError>) -> Void) {
        return getWorkoutRoutine(withNetwork: withNetwork, workoutRoutineId: workoutRoutineId, completion: completion)
    }
    func getWorkoutRoutines(limit: Int, after: String?, withNetwork: Bool = false, completion: @escaping (Result<[WorkoutRoutine], APIError>) -> Void) {
        return getWorkoutRoutines(limit: limit, after: after, withNetwork: withNetwork, completion: completion)
    }
    func getWorkoutSessions(limit: Int, after: String?, withNetwork: Bool = false, completion: @escaping (Result<[WorkoutSession], APIError>) -> Void) {
        return getWorkoutSessions(limit: limit, after: after, withNetwork: withNetwork, completion: completion)
    }
    func getWorkoutSession(workoutSessionId: String, withNetwork: Bool = false, completion: @escaping (Result<WorkoutSession, APIError>) -> Void) {
        return getWorkoutSession(workoutSessionId: workoutSessionId, withNetwork: withNetwork, completion: completion)
    }
    func getExerciseRoutines(workoutRoutineId: String, withNetwork: Bool = false, completion: @escaping (Result<[ExerciseRoutine], APIError>) -> Void) {
        return getExerciseRoutines(workoutRoutineId: workoutRoutineId, withNetwork: withNetwork, completion: completion)
    }
}

class WorkoutLoggerAPIService: WorkoutLoggerAPIServiceProtocol {
    private var client: ApolloClient
    
    init(client: ApolloClient = WorkoutLoggerAPIClient.client) {
        self.client = client
    }
    
    func getWorkoutRoutine(withNetwork: Bool = false, workoutRoutineId: String, completion: @escaping (Result<WorkoutRoutine, APIError>) -> Void) {
        var cachePolicy: CachePolicy = .returnCacheDataElseFetch
        if withNetwork {
            cachePolicy = .fetchIgnoringCacheData
        }
        self.client.fetch(query: WorkoutLoggerAPI.WorkoutRoutineQuery(workoutRoutineId: workoutRoutineId), cachePolicy: cachePolicy) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let workoutRoutine = response.data?.workoutRoutine.fragments.workoutRoutineFull {
                    let parsedWorkoutRoutine = Parser.WorkoutRoutine(workoutRoutine)
                    completion(.success(parsedWorkoutRoutine))
                    return
                }
                completion(.failure(.unknown))
                
            case .failure:
                completion(.failure(.networkError))
                
            }
        }
    }
    
    func getWorkoutRoutines(limit: Int, after: String?, withNetwork: Bool = false, completion: @escaping (Result<[WorkoutRoutine], APIError>) -> Void) {
        var cachePolicy: CachePolicy = .returnCacheDataElseFetch
        if withNetwork {
            cachePolicy = .fetchIgnoringCacheData
        }
        self.client.fetch(query: WorkoutLoggerAPI.WorkoutRoutinesQuery(limit: limit, after: after ?? .none), cachePolicy: cachePolicy) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let workoutRoutines = response.data?.workoutRoutines {
                    let parsedWorkoutRoutines = workoutRoutines.edges.compactMap { Parser.WorkoutRoutine($0.node.fragments.workoutRoutineFull) }
                    completion(Result.success(parsedWorkoutRoutines))
                    return
                }

                completion(Result.failure(.unknown))
                
            case .failure:
                completion(Result.failure(.networkError))
                
            }
        }
    }
    
    func getWorkoutSessions(limit: Int, after: String?, withNetwork: Bool = false, completion: @escaping (Result<[WorkoutSession], APIError>) -> Void) {
        var cachePolicy: CachePolicy = .returnCacheDataElseFetch
        if withNetwork {
            cachePolicy = .fetchIgnoringCacheData
        }
        self.client.fetch(query: WorkoutLoggerAPI.WorkoutSessionsQuery(limit: limit, after: after ?? .none), cachePolicy: cachePolicy) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let workoutSessions = response.data?.workoutSessions {
                    let parsedWorkoutSessions = workoutSessions.edges.compactMap { Parser.WorkoutSession($0.node.fragments.workoutSessionFull) }
                    completion(Result.success(parsedWorkoutSessions))
                    return
                }
                
                completion(Result.failure(.parsingError))
                
            case .failure:
                completion(Result.failure(.networkError))
                
            }
        }
    }
    
    func createWorkoutRoutine(name: String, completion: @escaping (Result<WorkoutLoggerAPI.CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, APIError>) -> Void) {
        self.client.perform(mutation: WorkoutLoggerAPI.CreateWorkoutRoutineMutation(routine: WorkoutLoggerAPI.WorkoutRoutineInput(name: name, exerciseRoutines: []))) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let workoutRoutine = response.data?.createWorkoutRoutine {
                    completion(Result.success(workoutRoutine))
                } else {
                    completion(Result.failure(.GraphQLError(gqlError: nil)))
                }
                
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }
    
    func updateWorkoutRoutine(_ workoutRoutine: WorkoutRoutine, completion: @escaping (Result<WorkoutRoutine, APIError>) -> Void) {
        let parsedWorkoutRoutine = Parser.UpdateWorkoutRoutineInput(workoutRoutine)
        
        self.client.perform(mutation: WorkoutLoggerAPI.UpdateWorkoutRoutineMutation(workoutRoutine: parsedWorkoutRoutine)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let updatedWorkoutRoutine = response.data?.updateWorkoutRoutine.fragments.workoutRoutineFull {
                    let parsedUpdatedWorkoutRoutine = Parser.WorkoutRoutine(updatedWorkoutRoutine)
                    completion(Result.success(parsedUpdatedWorkoutRoutine))
                    return
                }
                
                completion(Result.failure(.unknown))
                
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }
    
    func deleteWorkoutRoutine(id: String, completion: @escaping (Result<Int, APIError>) -> Void) {
        
        self.client.perform(mutation: WorkoutLoggerAPI.DeleteWorkoutRoutineMutation(workoutRoutineId: id)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let deleteWorkoutRoutine = response.data?.deleteWorkoutRoutine {
                    completion(Result.success(deleteWorkoutRoutine))
                    return
                }
                
                completion(Result.failure(.unknown))
                
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }

    func deleteWorkoutSession(id: String, completion: @escaping (Result<Int, APIError>) -> Void) {
        self.client.perform(mutation: WorkoutLoggerAPI.DeleteWorkoutSessionMutation(workoutSessionId: id)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }

                if let deleteWorkoutSession = response.data?.deleteWorkoutSession {
                    completion(Result.success(deleteWorkoutSession))
                    return
                }

                completion(Result.failure(.unknown))

            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }

    
    func addWorkoutSession(id: String, start: Date, completion: @escaping (Result<WorkoutSession, APIError>) -> Void) {
        let workoutSession = WorkoutLoggerAPI.WorkoutSessionInput(workoutRoutineId: id, start: start, exercises: [])
        self.client.perform(mutation: WorkoutLoggerAPI.AddWorkoutSessionMutation(workout: workoutSession)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let newWorkoutSession = response.data?.addWorkoutSession.fragments.workoutSessionFull {
                    let parsedWorkoutSession = Parser.WorkoutSession(newWorkoutSession)

                    completion(Result.success(parsedWorkoutSession))
                    return
                }
                
                completion(Result.failure(.unknown))
                
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }
 
    func getWorkoutSession(
        workoutSessionId: String,
        withNetwork: Bool = false,
        completion: @escaping (Result<WorkoutSession, APIError>) -> Void
    ) {
        var cachePolicy: CachePolicy = .returnCacheDataElseFetch
        if withNetwork {
            cachePolicy = .fetchIgnoringCacheData
        }
        self.client.fetch(query: WorkoutLoggerAPI.WorkoutSessionQuery(workoutSessionId: workoutSessionId), cachePolicy: cachePolicy) { result in
            switch result {
            case .success(let response):
                
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let workoutSession = response.data?.workoutSession.fragments.workoutSessionFull {
                    let parsedWorkoutSession = Parser.WorkoutSession(workoutSession)
                    completion(Result.success(parsedWorkoutSession))
                    return
                }

                completion(Result.failure(.unknown))
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }
    
    func getExerciseRoutines(workoutRoutineId: String, withNetwork: Bool = false, completion: @escaping (Result<[ExerciseRoutine], APIError>) -> Void) {
        self.client.fetch(query: WorkoutLoggerAPI.ExerciseRoutinesQuery(workoutRoutineId: workoutRoutineId)) { result in
            switch result {
            case .success(let response):
                
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let exerciseRoutines = response.data?.exerciseRoutines {
                    let parsedExerciseRoutines = exerciseRoutines.compactMap { Parser.ExerciseRoutine($0.fragments.exerciseRoutineFull) }
                    completion(Result.success(parsedExerciseRoutines))
                    return
                }
                 
                completion(Result.failure(.unknown))
                
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }
    
    func addExercise(workoutSessionId: String, exerciseRoutineId: String, completion: @escaping (Result<Exercise, APIError>) -> Void) {
        let exerciseInput = WorkoutLoggerAPI.ExerciseInput(
            exerciseRoutineId: exerciseRoutineId,
            notes: "",
            setEntries: []
        )
        self.client.perform(mutation: WorkoutLoggerAPI.AddExerciseMutation(workoutSessionId: workoutSessionId, exercise: exerciseInput)) { result in
            switch result {
            case .success(let response):
                
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let newExercise = response.data?.addExercise.fragments.exerciseDetails {
                    let parsedExercise = Parser.Exercise(newExercise)
                    completion(Result.success(parsedExercise))
                    return
                }
                
                completion(Result.failure(.unknown))
                
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }
    
    func addSetEntry(exerciseId: String, setEntry: SetEntry, completion: @escaping (Result<SetEntry, APIError>) -> Void) {
        let setEntryInput = Parser.AddSetEntryInput(setEntry)
        self.client.perform(mutation: WorkoutLoggerAPI.AddSetMutation(exerciseId: exerciseId, set: setEntryInput)) { result in
            switch result {
            case .success(let response):
                
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let newSetEntry = response.data?.addSet.fragments.setEntryFull {
                    let parsedSetEntry = Parser.SetEntry(newSetEntry)
                    completion(Result.success(parsedSetEntry))
                    return
                }
                
                completion(Result.failure(.unknown))
                
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }

    func deleteExercise(exerciseId: String, completion: @escaping ((Result<Int, APIError>) -> Void)) {
        self.client.perform(mutation: WorkoutLoggerAPI.DeleteExerciseMutation(exerciseId: exerciseId)) { result in
            switch result {
            case .success(let response):

                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }

                if let deleteExercise = response.data?.deleteExercise {
                    completion(Result.success(deleteExercise))
                    return
                }

                completion(Result.failure(.unknown))

            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }

    func updateExercise(exerciseId: String, notes: String, completion: @escaping (Result<Exercise, APIError>) -> Void) {
        let exerciseInput = WorkoutLoggerAPI.UpdateExerciseInput(notes: notes)
        self.client.perform(mutation: WorkoutLoggerAPI.UpdateExerciseMutation(exerciseId: exerciseId, exercise: exerciseInput)) { result in
            switch result {
            case .success(let response):

                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }

                if let updatedExercise = response.data?.updateExercise {
                    // TODO make sure to populate set to not mess up sets in cache
                    completion(Result.success(Exercise(id: updatedExercise.id, sets: [], notes: updatedExercise.notes)))
                    return
                }

                completion(Result.failure(.unknown))

            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }
}

