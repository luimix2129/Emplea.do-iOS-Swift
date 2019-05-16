//
//  JobsTarget.swift
//  Emplea.do
//
//  Created by Eleazar Estrella GB on 5/16/19.
//  Copyright © 2019 Eleazar Estrella. All rights reserved.
//

import Foundation
import Moya

enum JobsTarget {
    case getJobs(page: Int)
    case getSoftwareDevelopmentJobs(page: Int)
    case getWebDevelopmentJobs(page: Int)
    case getMobileDevelopmentJobs(page: Int)
    case getNetworkingJobs(page: Int)
    case getSystemAdminJobs(page: Int)
    
    var identifier: String {
        switch self {
        case .getJobs(_):
            return "NONE"
        case .getSoftwareDevelopmentJobs(_):
            return "SoftwareDevelopment"
        case .getWebDevelopmentJobs(_):
            return "WebDevelopment"
        case .getMobileDevelopmentJobs(_):
            return "MobileDevelopment"
        case .getNetworkingJobs(_):
            return "Networking"
        case .getSystemAdminJobs(_):
            return "SystemAdministrator"
        }
    }
}

extension JobsTarget: TargetType {
    
    var defaultPageSize: Int {
        return 12
    }
    
    var baseURL: URL {
        return URL(string: "https://api.cuatrokb.com/v1/empleado")!
    }
    
    var path: String {
        return "/jobs.json"
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self{
        case .getJobs(let page), .getSoftwareDevelopmentJobs(let page),
             .getWebDevelopmentJobs(let page), .getMobileDevelopmentJobs(let page),
             .getNetworkingJobs(let page),  .getSystemAdminJobs(let page):
            return .requestParameters(parameters: [
            "Page": page,
            "PageSize": defaultPageSize,
            "JobCategory": self.identifier ], encoding: URLEncoding.queryString)
        }
    }
}
