Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.14653.1618413286511512385
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 08:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWhE1-00017J-5y; Wed, 14 Apr 2021 18:14:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 1/6] python3-bugsnag: Upgrade 3.6.1 -> 4.0.2
Date: Wed, 14 Apr 2021 18:14:30 +0300
Message-Id: <20210414151435.9049-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 4.0.2:

- Fixed an issue preventing code being fetched from files in the
  project root but not in the PWD
- Fix issue where types were not packaged with the library
- Added __all__ lists throughout to indicate the boundaries of the
  public interface. This may affect your integration if using
  import *.
- Removed Configuration.use_ssl and Configuration.get_endpoint()
  in favor of including the protocol in Configuration.endpoint
- Configuration.send_environment is now False by default. Enable
  it as a part of your configuration to send the full request
  context (if any) as a part of each event.
- Removed bugsnag.utils.ThreadLocals as it has been superseded by
  the contextvars API
- Removed bugsnag.utils.merge_dicts, an unused helper function
- Removed bugsnag.send_sessions
- Deprecated bugsnag.notification.Notification in favor of
  bugsnag.event.Event to better align with Bugsnag libraries on
  other platforms. The Notification class is functionally
  equivalent and will be removed in a future release.
- Added a request property to Event.
- Added type signatures throughout the library.
- [WSGI] Use X-Forwarded-For header if present to determine the IP
  address used as the default user ID. The remote address remains
  available in the request metadata attached to the event.

License-Update: Check only a single line from PKG-INFO

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bugsnag_3.6.1.bb => python3-bugsnag_4.0.2.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename recipes-devtools/python/{python3-bugsnag_3.6.1.bb => python3-bugsnag_4.0.2.bb} (70%)

diff --git a/recipes-devtools/python/python3-bugsnag_3.6.1.bb b/recipes-devtools/python/python3-bugsnag_4.0.2.bb
similarity index 70%
rename from recipes-devtools/python/python3-bugsnag_3.6.1.bb
rename to recipes-devtools/python/python3-bugsnag_4.0.2.bb
index 3238579..96550bb 100644
--- a/recipes-devtools/python/python3-bugsnag_3.6.1.bb
+++ b/recipes-devtools/python/python3-bugsnag_4.0.2.bb
@@ -8,10 +8,9 @@ DESCRIPTION = "\
   "
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3bc101ebc0815bd849021892cd333dd4"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "93443091b052130cfe1daf7595249f9f"
-SRC_URI[sha256sum] = "8878437aa44ec485cecb255742035b3b98a6c7e7d167a943b5fbe597b2f8f7f9"
+SRC_URI[sha256sum] = "7a49dacf055a8c6dda4ce714acd91fabe9546f1ad826276918a26603a8b5489a"
 
 inherit pypi setuptools3
 
-- 
2.17.1

