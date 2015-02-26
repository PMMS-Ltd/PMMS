package uk.org.pmms

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class SupplierTypeController {
    static scaffold = true
}
