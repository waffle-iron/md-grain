import grails.util.Environment

def configLocations = []
configLocations << "file:${userHome}/.grails/${appName}-${Environment.current}-config.groovy"
grails.config.locations = configLocations

log.debug "Archivos de configuración: " + configLocations

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

// migration configuration
grails.plugin.databasemigration.updateOnStart = true
grails.plugin.databasemigration.updateOnStartFileNames = ['changelog.groovy']

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false
def logDirectory = "target/"
environments {
  development {
    grails.serverURL = "http://localhost:8080/md-grain"
    grails.logging.jul.usebridge = true
  }
  production {
    grails.serverURL = "http://makingdevs.com"
    grails.logging.jul.usebridge = false
    logDirectory = "logs/"
  }
}

log4j = {

  appenders {
    //console name: 'stdout', layout: pattern(conversionPattern: '%d{ISO8601}\t%p\t%c:%L\t%m%n'), threshold: org.apache.log4j.Level.ERROR
    appender new org.apache.log4j.DailyRollingFileAppender(name: 'file', file: logDirectory + "md-grain.log", datePattern: '\'_\'yyyy-MM-dd', layout: pattern(conversionPattern: '%d{ISO8601}\t%p\t%c:%L\t%m%n'))
  }

  root {
    debug 'file'
  }

  debug 'grails.app.controllers.com.makingdevs',
      'grails.app.taglib.com.makingdevs',
      'grails.app.services.com.makingdevs',
      'grails.app.domain.com.makingdevs',
      'grails.app.conf',
      'grails.app.jobs.com.makingdevs',
      'grails.app.jobs.com.payable',
      'groovyx'

  warn 'org.codehaus.groovy.grails.web.servlet',  //  controllers
      'org.codehaus.groovy.grails.web.pages', //  GSP
      'org.codehaus.groovy.grails.web.sitemesh', //  layouts
      'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
      'org.codehaus.groovy.grails.web.mapping', // URL mapping
      'org.codehaus.groovy.grails.commons', // core / classloading
      'org.codehaus.groovy.grails.plugins', // plugins
      'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
      'org.codehaus',
      'org.springframework',
      'org.hibernate',
      'org.mortbay.log',
      'net.sf',
      'org.terracotta',
      'org.quartz',
      'org.apache',
      'net.bull',
      'grails.spring',
      'net.sf.ehcache.hibernate',
      'org.grails.tomcat',
      'org.grails.plugin.resource',
      'grails.app.taglib.org.grails.plugin',
      'grails.plugin.cache',
      'grails.plugin.webxml',
      'rhino',
      'org.lesscss',
      'grails.app.resourceMappers',
      'liquibase',
      'org.grails.datastore',
      'grails.plugin.databasemigration',
      'grails.app.jobs',
      'grails.plugins.quartz',
      'org.jets3',
      'grails.util'

  error 'net.sf.ehcache', 'net.sf.ehcache.hibernate', 'org.hibernate'

  environments {
    production {
      // Override previous setting
      error "grails",
          "org",
          "net",
          "com",
          "groovyx",
          "net.bull.javamelody",
          "httpclient"
    }
  }

}

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'com.makingdevs.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'com.makingdevs.UserRole'
grails.plugins.springsecurity.authority.className = 'com.makingdevs.Role'
grails.plugins.springsecurity.requestMap.className = 'com.makingdevs.Requestmap'
grails.plugins.springsecurity.securityConfigType = 'Requestmap'
grails.plugins.springsecurity.facebook.domain.classname='com.makingdevs.FacebookUser'
grails.plugins.springsecurity.facebook.filter.type='redirect'
grails.plugins.springsecurity.facebook.facebook.permissions='email'

// Uncomment and edit the following lines to start using Grails encoding & escaping improvements

/* remove this line 
// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside null
                scriptlet = 'none' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        filteringCodecForContentType {
            //'text/html' = 'html'
        }
    }
}
remove this line */
