#! /usr/bin/env bash

dart run icons_launcher:create
dart run rename setAppName --targets android,ios,linux,macos,web,windows --value "Tiny Swords"