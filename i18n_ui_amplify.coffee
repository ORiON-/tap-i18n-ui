# Add amplify helper to TAPi18n
TAPi18n.setLanguageAmplify = (language) ->
  amplify.store 'tap-i18n-language', language
  TAPi18n.setLanguage language

# set the language on startup if it's already been set, otherwise set default
Meteor.startup ->
  storedLanguage = amplify.store 'tap-i18n-language'
  if storedLanguage
    TAPi18n.setLanguage storedLanguage
  else
    TAPi18n.setLanguageAmplify TAPi18n.conf.supported_languages[0]
