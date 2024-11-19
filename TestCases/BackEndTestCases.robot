*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     ApiResquests/OpenLibraryApi.py

*** Variables ***
${title}                           harry potter
${author}                          rowling
${expected_website}                http://www.jkrowling.com/
${expexted_publish_places}         Ḍhākā
${expected_book_tile}              Harry Potter and the Deathly Hallows

*** Test Cases ***
Search a Book and Get Author's Detail by Author Key
    Call Search Api                     ${title}                            ${author}
    ${response}                         Get Author Data By Author Key
    Should Be Equal As Strings          ${response}[links][0][url]          ${expected_website}

Get a Book Edition Details with ISBN API
    ${response}                         Call Isbn Api
    Should Be Equal As Strings          ${response}[publish_places][0]      ${expexted_publish_places}

Get a Book Edition Details with Editions API
    ${response}                         Call Edition Api By Edition Id
    Should Be Equal As Strings          ${response}[title]    ${expected_book_tile}






