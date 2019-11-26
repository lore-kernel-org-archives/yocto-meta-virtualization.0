Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.5360.1574731072171973892
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 17:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: windriver.com, ip: 140.211.169.56, mailfrom: qi.chen@windriver.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B900AE00F6F; Mon, 25 Nov 2019 17:17:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FF89E00E3A
	for <meta-virtualization@yoctoproject.org>; Mon, 25 Nov 2019 17:17:50 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xAQ1HmLd030195
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 25 Nov 2019 17:17:48 -0800
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 25 Nov
 2019 17:17:47 -0800
Subject: Re: [meta-virtualization][PATCH] python3-docker-compose: remove maximum version requirements
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20191122074510.1992-1-Qi.Chen@windriver.com>
 <20191125211220.GA28355@gmail.com>
CC: <meta-virtualization@yoctoproject.org>, <liu.ming50@gmail.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <d18614ca-6630-2c7a-dc24-f6708a4b144e@windriver.com>
Date: Tue, 26 Nov 2019 09:32:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20191125211220.GA28355@gmail.com>
X-Originating-IP: [128.224.162.184]
Content-Type: multipart/alternative;
	boundary="------------3A5B7499CD432F3130CB3E5A"

--------------3A5B7499CD432F3130CB3E5A
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/2019 05:12 AM, Bruce Ashfield wrote:
> In message: [meta-virtualization][PATCH] python3-docker-compose: remove maximum version requirements
> on 22/11/2019 Chen Qi wrote:
>
>> Remove maximum version requirements for docker-compose so that it
>> does not require old version recipes.
> Which oe-core versions of the packages are newer than the maximum values
> listed in docer compose ?
>
> I'd like to log that in this commit log .. since that is the justification
> for the patch.
>
> Bruce

Hi Bruce,

I've sent out V2 adding the information. Totally, it's 5 old recipes 
that are needed.

@Ming, I hope your upgrade to 1.25 could also rebase on this patch if 
it's merged.
Because meta-python usually upgrades the packages to latest versions, 
and we will soon meet the same problem.

Bruce, I have communicated with docker-compose upstream, they have 
confirmed that they will not remove the maximum version constraints. See 
https://github.com/docker/compose/issues/7024.

Best Regards,
Chen Qi

>> The current one has been tested against https://docs.docker.com/compose/gettingstarted/.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   ...upport-newer-minor-version-of-reques.patch | 44 --------------
>>   ...-remove-maximum-version-requirements.patch | 58 +++++++++++++++++++
>>   .../python3-docker-compose_1.21.2.bb          |  2 +-
>>   3 files changed, 59 insertions(+), 45 deletions(-)
>>   delete mode 100644 recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
>>   create mode 100644 recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
>>
>> diff --git a/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch b/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
>> deleted file mode 100644
>> index 48a6f25..0000000
>> --- a/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
>> +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -From b4655b5e7f1e5b87a758dfd7af01a49a40ed148a Mon Sep 17 00:00:00 2001
>> -From: Li Zhou <li.zhou@windriver.com>
>> -Date: Thu, 10 Oct 2019 15:46:20 +0800
>> -Subject: [PATCH] docker-compose: support newer minor version of requests
>> -
>> -Signed-off-by: Ofek Lev <ofekmeister@gmail.com>
>> -
>> -Upstream-Status: Backport
>> -
>> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> ----
>> - requirements.txt | 2 +-
>> - setup.py         | 2 +-
>> - 2 files changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/requirements.txt b/requirements.txt
>> -index 93a0cce..42bde41 100644
>> ---- a/requirements.txt
>> -+++ b/requirements.txt
>> -@@ -16,7 +16,7 @@ pypiwin32==219; sys_platform == 'win32' and python_version < '3.6'
>> - pypiwin32==220; sys_platform == 'win32' and python_version >= '3.6'
>> - PySocks==1.6.7
>> - PyYAML==3.12
>> --requests==2.18.4
>> -+requests==2.19.1
>> - six==1.10.0
>> - texttable==0.9.1
>> - urllib3==1.21.1
>> -diff --git a/setup.py b/setup.py
>> -index 422ba54..a74ee0f 100644
>> ---- a/setup.py
>> -+++ b/setup.py
>> -@@ -33,7 +33,7 @@ install_requires = [
>> -     'cached-property >= 1.2.0, < 2',
>> -     'docopt >= 0.6.1, < 0.7',
>> -     'PyYAML >= 3.10, < 4',
>> --    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.19',
>> -+    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.20',
>> -     'texttable >= 0.9.0, < 0.10',
>> -     'websocket-client >= 0.32.0, < 1.0',
>> -     'docker >= 3.3.0, < 4.0',
>> ---
>> -1.9.1
>> -
>> diff --git a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
>> new file mode 100644
>> index 0000000..54835ff
>> --- /dev/null
>> +++ b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
>> @@ -0,0 +1,58 @@
>> +From 2685716409c560cdf94aee6262ed8c32ad137133 Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Fri, 22 Nov 2019 09:24:58 +0800
>> +Subject: [PATCH] setup.py: remove maximum version requirements
>> +
>> +Remove maximum version requirements so that docker-compose will not
>> +require old version recipes.
>> +
>> +Upstream-Status: Inappropriate [OE Specific]
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + setup.py | 22 +++++++++++-----------
>> + 1 file changed, 11 insertions(+), 11 deletions(-)
>> +
>> +diff --git a/setup.py b/setup.py
>> +index 422ba54..c2b4556 100644
>> +--- a/setup.py
>> ++++ b/setup.py
>> +@@ -30,16 +30,16 @@ def find_version(*file_paths):
>> +
>> +
>> + install_requires = [
>> +-    'cached-property >= 1.2.0, < 2',
>> +-    'docopt >= 0.6.1, < 0.7',
>> +-    'PyYAML >= 3.10, < 4',
>> +-    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.19',
>> +-    'texttable >= 0.9.0, < 0.10',
>> +-    'websocket-client >= 0.32.0, < 1.0',
>> +-    'docker >= 3.3.0, < 4.0',
>> +-    'dockerpty >= 0.4.1, < 0.5',
>> +-    'six >= 1.3.0, < 2',
>> +-    'jsonschema >= 2.5.1, < 3',
>> ++    'cached-property >= 1.2.0',
>> ++    'docopt >= 0.6.1',
>> ++    'PyYAML >= 3.10',
>> ++    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0',
>> ++    'texttable >= 0.9.0',
>> ++    'websocket-client >= 0.32.0',
>> ++    'docker >= 3.3.0',
>> ++    'dockerpty >= 0.4.1',
>> ++    'six >= 1.3.0',
>> ++    'jsonschema >= 2.5.1',
>> + ]
>> +
>> +
>> +@@ -56,7 +56,7 @@ extras_require = {
>> +     ':python_version < "3.5"': ['backports.ssl_match_hostname >= 3.5'],
>> +     ':python_version < "3.3"': ['ipaddress >= 1.0.16'],
>> +     ':sys_platform == "win32"': ['colorama >= 0.3.9, < 0.4'],
>> +-    'socks': ['PySocks >= 1.5.6, != 1.5.7, < 2'],
>> ++    'socks': ['PySocks >= 1.5.6, != 1.5.7'],
>> + }
>> +
>> +
>> +--
>> +2.17.1
>> +
>> diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
>> index a7f7b1c..a895005 100644
>> --- a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
>> +++ b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE = "https://www.docker.com/"
>>   LICENSE = "Apache-2.0"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
>>   
>> -SRC_URI += "file://0001-docker-compose-support-newer-minor-version-of-reques.patch"
>> +SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch"
>>   
>>   inherit pypi setuptools3
>>   
>> -- 
>> 2.17.1
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>>
>> View/Reply Online (#4733): https://lists.yoctoproject.org/g/meta-virtualization/message/4733
>> Mute This Topic: https://lists.yoctoproject.org/mt/61564429/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4745): https://lists.yoctoproject.org/g/meta-virtualization/message/4745
> Mute This Topic: https://lists.yoctoproject.org/mt/61564429/3618072
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-



--------------3A5B7499CD432F3130CB3E5A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/26/2019 05:12 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote cite="mid:20191125211220.GA28355@gmail.com" type="cite">
      <pre wrap="">In message: [meta-virtualization][PATCH] python3-docker-compose: remove maximum version requirements
on 22/11/2019 Chen Qi wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="">Remove maximum version requirements for docker-compose so that it
does not require old version recipes.
</pre>
      </blockquote>
      <pre wrap="">
Which oe-core versions of the packages are newer than the maximum values
listed in docer compose ?

I'd like to log that in this commit log .. since that is the justification
for the patch.

Bruce
</pre>
    </blockquote>
    <br>
    Hi Bruce,<br>
    <br>
    I've sent out V2 adding the information. Totally, it's 5 old recipes
    that are needed.<br>
    <br>
    @Ming, I hope your upgrade to 1.25 could also rebase on this patch
    if it's merged.<br>
    Because meta-python usually upgrades the packages to latest
    versions, and we will soon meet the same problem.<br>
    <br>
    Bruce, I have communicated with docker-compose upstream, they have
    confirmed that they will not remove the maximum version constraints.
    See <a class="moz-txt-link-freetext" href="https://github.com/docker/compose/issues/7024">https://github.com/docker/compose/issues/7024</a>.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote cite="mid:20191125211220.GA28355@gmail.com" type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">
The current one has been tested against <a class="moz-txt-link-freetext" href="https://docs.docker.com/compose/gettingstarted/">https://docs.docker.com/compose/gettingstarted/</a>.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 ...upport-newer-minor-version-of-reques.patch | 44 --------------
 ...-remove-maximum-version-requirements.patch | 58 +++++++++++++++++++
 .../python3-docker-compose_1.21.2.bb          |  2 +-
 3 files changed, 59 insertions(+), 45 deletions(-)
 delete mode 100644 recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
 create mode 100644 recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch

diff --git a/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch b/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
deleted file mode 100644
index 48a6f25..0000000
--- a/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From b4655b5e7f1e5b87a758dfd7af01a49a40ed148a Mon Sep 17 00:00:00 2001
-From: Li Zhou <a class="moz-txt-link-rfc2396E" href="mailto:li.zhou@windriver.com">&lt;li.zhou@windriver.com&gt;</a>
-Date: Thu, 10 Oct 2019 15:46:20 +0800
-Subject: [PATCH] docker-compose: support newer minor version of requests
-
-Signed-off-by: Ofek Lev <a class="moz-txt-link-rfc2396E" href="mailto:ofekmeister@gmail.com">&lt;ofekmeister@gmail.com&gt;</a>
-
-Upstream-Status: Backport
-
-Signed-off-by: Li Zhou <a class="moz-txt-link-rfc2396E" href="mailto:li.zhou@windriver.com">&lt;li.zhou@windriver.com&gt;</a>
----
- requirements.txt | 2 +-
- setup.py         | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/requirements.txt b/requirements.txt
-index 93a0cce..42bde41 100644
---- a/requirements.txt
-+++ b/requirements.txt
-@@ -16,7 +16,7 @@ pypiwin32==219; sys_platform == 'win32' and python_version &lt; '3.6'
- pypiwin32==220; sys_platform == 'win32' and python_version &gt;= '3.6'
- PySocks==1.6.7
- PyYAML==3.12
--requests==2.18.4
-+requests==2.19.1
- six==1.10.0
- texttable==0.9.1
- urllib3==1.21.1
-diff --git a/setup.py b/setup.py
-index 422ba54..a74ee0f 100644
---- a/setup.py
-+++ b/setup.py
-@@ -33,7 +33,7 @@ install_requires = [
-     'cached-property &gt;= 1.2.0, &lt; 2',
-     'docopt &gt;= 0.6.1, &lt; 0.7',
-     'PyYAML &gt;= 3.10, &lt; 4',
--    'requests &gt;= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, &lt; 2.19',
-+    'requests &gt;= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, &lt; 2.20',
-     'texttable &gt;= 0.9.0, &lt; 0.10',
-     'websocket-client &gt;= 0.32.0, &lt; 1.0',
-     'docker &gt;= 3.3.0, &lt; 4.0',
--- 
-1.9.1
-
diff --git a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
new file mode 100644
index 0000000..54835ff
--- /dev/null
+++ b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
@@ -0,0 +1,58 @@
+From 2685716409c560cdf94aee6262ed8c32ad137133 Mon Sep 17 00:00:00 2001
+From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+Date: Fri, 22 Nov 2019 09:24:58 +0800
+Subject: [PATCH] setup.py: remove maximum version requirements
+
+Remove maximum version requirements so that docker-compose will not
+require old version recipes.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+---
+ setup.py | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 422ba54..c2b4556 100644
+--- a/setup.py
++++ b/setup.py
+@@ -30,16 +30,16 @@ def find_version(*file_paths):
+ 
+ 
+ install_requires = [
+-    'cached-property &gt;= 1.2.0, &lt; 2',
+-    'docopt &gt;= 0.6.1, &lt; 0.7',
+-    'PyYAML &gt;= 3.10, &lt; 4',
+-    'requests &gt;= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, &lt; 2.19',
+-    'texttable &gt;= 0.9.0, &lt; 0.10',
+-    'websocket-client &gt;= 0.32.0, &lt; 1.0',
+-    'docker &gt;= 3.3.0, &lt; 4.0',
+-    'dockerpty &gt;= 0.4.1, &lt; 0.5',
+-    'six &gt;= 1.3.0, &lt; 2',
+-    'jsonschema &gt;= 2.5.1, &lt; 3',
++    'cached-property &gt;= 1.2.0',
++    'docopt &gt;= 0.6.1',
++    'PyYAML &gt;= 3.10',
++    'requests &gt;= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0',
++    'texttable &gt;= 0.9.0',
++    'websocket-client &gt;= 0.32.0',
++    'docker &gt;= 3.3.0',
++    'dockerpty &gt;= 0.4.1',
++    'six &gt;= 1.3.0',
++    'jsonschema &gt;= 2.5.1',
+ ]
+ 
+ 
+@@ -56,7 +56,7 @@ extras_require = {
+     ':python_version &lt; "3.5"': ['backports.ssl_match_hostname &gt;= 3.5'],
+     ':python_version &lt; "3.3"': ['ipaddress &gt;= 1.0.16'],
+     ':sys_platform == "win32"': ['colorama &gt;= 0.3.9, &lt; 0.4'],
+-    'socks': ['PySocks &gt;= 1.5.6, != 1.5.7, &lt; 2'],
++    'socks': ['PySocks &gt;= 1.5.6, != 1.5.7'],
+ }
+ 
+ 
+-- 
+2.17.1
+
diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
index a7f7b1c..a895005 100644
--- a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
+++ b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://www.docker.com/">"https://www.docker.com/"</a>
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8">"file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"</a>
 
-SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-docker-compose-support-newer-minor-version-of-reques.patch">"file://0001-docker-compose-support-newer-minor-version-of-reques.patch"</a>
+SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-setup.py-remove-maximum-version-requirements.patch">"file://0001-setup.py-remove-maximum-version-requirements.patch"</a>
 
 inherit pypi setuptools3
 
-- 
2.17.1

</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.

View/Reply Online (#4733): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/4733">https://lists.yoctoproject.org/g/meta-virtualization/message/4733</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/61564429/1050810">https://lists.yoctoproject.org/mt/61564429/1050810</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>  [<a class="moz-txt-link-abbreviated" href="mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.

View/Reply Online (#4745): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/4745">https://lists.yoctoproject.org/g/meta-virtualization/message/4745</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/61564429/3618072">https://lists.yoctoproject.org/mt/61564429/3618072</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>  [<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------3A5B7499CD432F3130CB3E5A--
