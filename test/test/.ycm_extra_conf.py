#!/usr/bin/env python
#
# Copyright (C) 2014  Google Inc.
#
# This file is part of YouCompleteMe.
#
# YouCompleteMe is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# YouCompleteMe is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with YouCompleteMe.  If not, see <http://www.gnu.org/licenses/>.
import os
import ycm_core
# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
'-Wall',        # Enable all warnings
'-Wextra',      # Enable extra warnings
'-Wno-unused-parameter',
'-fobjc-arc',
'-fobjc-exceptions',
'-fexceptions',
'-fobjc-runtime=ios-8.1.0',
'-fencode-extended-block-signature',
'-DNDEBUG',
'-x',
'objective-c',
'-isystem',
'/usr/include',
'-isystem',
'/usr/local/include',
'-I',
'/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
'-isysroot',
'/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS8.1.sdk',
'-F/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS8.1.sdk/System/Library/Frameworks'
'-F/Users/admin/Dropbox/dev/objc/memories',
'-F/Users/admin/Dropbox/dev/objc/memories/Pods/CrashlyticsFramework',
'-F/Users/admin/Dropbox/dev/objc/memories/Pods/Parse',
'-F/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/CrashlyticsFramework',
'-F/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Parse',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Build',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Build/Bolts',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Build/CrashlyticsFramework',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Build/MBProgressHUD',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Build/MagicalRecord',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Build/Parse',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Build/RBBAnimation',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Build/Reachability',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Build/SDCAlertView',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Build/SDCAutoLayout',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Build/SlackTextViewController',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Build/SlackTextViewController/Additions',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Build/SlackTextViewController/Classes',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Build/UICKeyChainStore',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/Bolts',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/CrashlyticsFramework',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/KIF',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/Kiwi',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/MBProgressHUD',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/MagicalRecord',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/Parse',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/RBBAnimation',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/Reachability',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/SDCAlertView',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/SDCAutoLayout',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/SlackTextViewController',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/SlackTextViewController/Additions',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/SlackTextViewController/Classes',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/Toast',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Headers/Public/UICKeyChainStore',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/Bolts',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/CrashlyticsFramework',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/KIF',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/Kiwi',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/MBProgressHUD',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/MagicalRecord',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/Parse',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/RBBAnimation',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/Reachability',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/SDCAlertView',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/SDCAutoLayout',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/SlackTextViewController',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/SlackTextViewController/Additions',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/SlackTextViewController/Classes',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/Toast',
'-I/Users/admin/Dropbox/dev/objc/memories/Pods/Pods/Headers/Public/UICKeyChainStore',
'-I/Users/admin/Dropbox/dev/objc/memories/LearningApp/CoreData',
'-I/Users/admin/Dropbox/dev/objc/memories/LearningApp/Model',
'-I/Users/admin/Dropbox/dev/objc/memories/LearningApp/Other',
'-I/Users/admin/Dropbox/dev/objc/memories/LearningApp/SupportingFiles',
'-I/Users/admin/Dropbox/dev/objc/memories/LearningApp/UI',
'-I/Users/admin/Dropbox/dev/objc/memories/LearningApp/UI/Toast/Toast',
'-I/Users/admin/Dropbox/dev/objc/memories/LearningApp/UI/Toast/Toast/Example',
'-I/Users/admin/Dropbox/dev/objc/memories/LearningApp/UI/Toast/Toast/Toast',
'-I/Users/admin/Dropbox/dev/objc/memories/LearningApp/ViewControllers',
'-include',
'/Users/admin/Dropbox/dev/objc/memories/LearningApp/SupportingFiles/LearningApp-Prefix.pch',
]
# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags.
compilation_database_folder = ''
if os.path.exists( compilation_database_folder ):
database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
database = None
SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]
def DirectoryOfThisScript():
return os.path.dirname( os.path.abspath( __file__ ) )
def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
if not working_directory:
return list( flags )
new_flags = []
make_next_absolute = False
path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
for flag in flags:
new_flag = flag
if make_next_absolute:
make_next_absolute = False
if not flag.startswith( '/' ):
new_flag = os.path.join( working_directory, flag )
for path_flag in path_flags:
if flag == path_flag:
make_next_absolute = True
break
if flag.startswith( path_flag ):
path = flag[ len( path_flag ): ]
new_flag = path_flag + os.path.join( working_directory, path )
break
if new_flag:
new_flags.append( new_flag )
return new_flags
def IsHeaderFile( filename ):
extension = os.path.splitext( filename )[ 1 ]
return extension in [ '.h', '.hxx', '.hpp', '.hh' ]
def GetCompilationInfoForFile( filename ):
# The compilation_commands.json file generated by CMake does not have entries
# for header files. So we do our best by asking the db for flags for a
# corresponding source file, if any. If one exists, the flags for that file
# should be good enough.
if IsHeaderFile( filename ):
basename = os.path.splitext( filename )[ 0 ]
for extension in SOURCE_EXTENSIONS:
replacement_file = basename + extension
if os.path.exists( replacement_file ):
compilation_info = database.GetCompilationInfoForFile(
replacement_file )
if compilation_info.compiler_flags_:
return compilation_info
return None
return database.GetCompilationInfoForFile( filename )
# This is the entry point; this function is called by ycmd to produce flags for
# a file.
def FlagsForFile( filename, **kwargs ):
if database:
# Bear in mind that compilation_info.compiler_flags_ does NOT return a
# python list, but a "list-like" StringVec object
compilation_info = GetCompilationInfoForFile( filename )
if not compilation_info:
return None
final_flags = MakeRelativePathsInFlagsAbsolute(
compilation_info.compiler_flags_,
compilation_info.compiler_working_dir_ )
else:
relative_to = DirectoryOfThisScript()
final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )
return {
'flags': final_flags,
'do_cache': True
  }
