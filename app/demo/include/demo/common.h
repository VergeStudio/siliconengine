#ifndef DEMO_COMMON_H
#define DEMO_COMMON_H

import silicon.platform;

#if SILICON_OS_FAMILY_WINDOWS
#    if defined(DEMO_SHARED_LIB)
#        if defined(DEMO_EXPORT)
#            define DEMO_API __declspec(dllexport)
#        else // !DEMO_EXPORT
#            define DEMO_API __declspec(dllimport)
#        endif // #if defined(DEMO_EXPORT)
#    else
#        define DEMO_API
#    endif
#else // PLATFORM_OS != PLATFORM_OS_WINDOWS_NT
#    if defined(DEMO_SHARED_LIB)
#        if defined(DEMO_EXPORT)
#            define DEMO_API __attribute__((visibility("default")))
#        else // !COMMON_EXPORT
#            define DEMO_API
#        endif // #if defined(DEMO_EXPORT)
#    else
#        define DEMO_API
#    endif
#endif // #if defined(SILICON_OS_FAMILY_WINDOWS)

#endif // DEMO_COMMON_H
