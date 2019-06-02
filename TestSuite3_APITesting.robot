*** Settings ***
Documentation    Suite description
Library          RequestsLibrary
Library         Collections
Library         JSONLibrary

*** Variables ***
${url}      http://thetestingworldapi.com
@{StudentID}    65  66  67  68  69  70

*** Test Cases ***
TC_001_FetchDetails1
    create session  FetchData   ${url}
    ${Response}=  get request   FetchData   api/studentsDetails/${StudentID}[0]
    ${status}=  convert to string  ${Response.status_code}
    should be equal  ${status}  200

TC_003_FetchDetails2
    create session      FetchData   ${url}
    ${Response}=    get request     FetchData   api/studentsDetails/${StudentID}[1]
    ${status}=  convert to string  ${Response.status_code}
    should be equal  ${status}  200

TC_003_FetchDetails3
    create session      FetchData   ${url}
    ${Response}=    get request     FetchData   api/studentsDetails/${StudentID}[2]
    ${status}=  convert to string  ${Response.status_code}
    should be equal  ${status}  200

TC_003_FetchDetails4
    create session      FetchData   ${url}
    ${Response}=    get request     FetchData   api/studentsDetails/${StudentID}[3]
    ${status}=  convert to string  ${Response.status_code}
    should be equal  ${status}  200

TC_003_FetchDetails5
    create session      FetchData   ${url}
    ${Response}=    get request     FetchData   api/studentsDetails/${StudentID}[4]
    ${status}=  convert to string  ${Response.status_code}
    should be equal  ${status}  200

TC_003_FetchDetails6
    create session      FetchData   ${url}
    ${Response}=    get request     FetchData   api/studentsDetails/${StudentID}[5]
    ${status}=  convert to string  ${Response.status_code}
    should be equal  ${status}  200

TC_002_PostDetails
    create session  AddData   ${url}
    &{body}=    create dictionary   first_name=rawtadeas   middle_name=Aasdf   last_name=last  date_of_birth=6/1/2019
    &{header}=  create dictionary   Content-Type=application/json

    ${Response}=    post request    AddData     /api/studentsDetails    data=${body}    headers=${header}
    ${code}=    convert to string    ${response.status_code}
    should be equal  ${code}     201


