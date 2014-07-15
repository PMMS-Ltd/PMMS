package uk.org.pmms.accounts

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class ServiceChargeTypeController {
    static scaffold = true
}
