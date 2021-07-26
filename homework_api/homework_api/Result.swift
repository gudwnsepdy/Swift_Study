//
//  Result.swift
//  homework_api
//
//  Created by 형주 on 2021/07/25.
//

struct country: Decodable {
    let currentCount: Int
    let data : [countryInfo]?
}

struct countryInfo: Decodable {
    
    let continent_cd : String
    let continent_eng_nm:String
    let continent_nm :String
    let country_eng_nm :String
    let country_iso_alp2 :String
    let country_nm :String
    let dang_map_download_url :String
    let evacuate_rcmnd_remark :String
    let flag_download_url :String
    let map_download_url :String
    let region_ty :String
    let written_dt :String
}
