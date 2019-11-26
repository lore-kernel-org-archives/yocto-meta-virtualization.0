Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.7564.1574745421705904501
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 21:17:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xAQ5GvBE003887
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 25 Nov 2019 21:16:57 -0800
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 25 Nov
 2019 21:16:56 -0800
Subject: Re: [meta-virtualization][PATCH] docker-compose: uprev to 1.25.0
To: Ming Liu <liu.ming50@gmail.com>,
        <meta-virtualization@lists.yoctoproject.org>
References: <1574712153-6498-1-git-send-email-liu.ming50@gmail.com>
CC: <stefan.agner@toradex.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <c91b1088-9c38-1c21-1b54-a2bdd3e5c88a@windriver.com>
Date: Tue, 26 Nov 2019 13:32:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1574712153-6498-1-git-send-email-liu.ming50@gmail.com>
X-Originating-IP: [128.224.162.184]
Content-Type: multipart/alternative;
	boundary="------------88E8EF63227ED23F0E4A7CF0"

--------------88E8EF63227ED23F0E4A7CF0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

1.25.0 requires new version of python3-docker.

Best Regards,
Chen Qi

On 11/26/2019 04:02 AM, Ming Liu wrote:
> From: Ming Liu <liu.ming50@gmail.com>
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>   ...docker-compose-compatible-with-PyYAML-5.3.patch | 36 ++++++++++++++++++
>   ...ose-support-newer-minor-version-of-reques.patch | 44 ----------------------
>   .../python3-docker-compose_1.21.2.bb               | 31 ---------------
>   .../python3-docker-compose_1.25.0.bb               | 34 +++++++++++++++++
>   4 files changed, 70 insertions(+), 75 deletions(-)
>   create mode 100644 recipes-containers/docker-compose/files/0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch
>   delete mode 100644 recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
>   delete mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
>   create mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
>
> diff --git a/recipes-containers/docker-compose/files/0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch b/recipes-containers/docker-compose/files/0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch
> new file mode 100644
> index 0000000..790648a
> --- /dev/null
> +++ b/recipes-containers/docker-compose/files/0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch
> @@ -0,0 +1,36 @@
> +From 10e9b0accbfef93f7d26d1cd470545ad64e370ff Mon Sep 17 00:00:00 2001
> +From: Ming Liu <liu.ming50@gmail.com>
> +Date: Mon, 25 Nov 2019 13:53:11 +0100
> +Subject: [PATCH] Make docker-compose compatible with PyYAML < 5.3.
> +
> +Upstream is not yet using PyYAML 5.1 as they are waiting for the
> +final 5.2 release (due api differences that does not affect compose),
> +so make it compatible with PyYAML < 5.3 as OE now ships with 5.1.2.
> +
> +Derives from:
> +https://github.com/foundriesio/meta-lmp/commit/117d2d73b9e982dec25f24a2665a1b03a040412f
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Ricardo Salveti <ricardo@foundries.io>
> +Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> +---
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 23ae08a..8a5f5d0 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -32,7 +32,7 @@ def find_version(*file_paths):
> + install_requires = [
> +     'cached-property >= 1.2.0, < 2',
> +     'docopt >= 0.6.1, < 1',
> +-    'PyYAML >= 3.10, < 5',
> ++    'PyYAML >= 3.10, < 5.3',
> +     'requests >= 2.20.0, < 3',
> +     'texttable >= 0.9.0, < 2',
> +     'websocket-client >= 0.32.0, < 1',
> +--
> +2.7.4
> +
> diff --git a/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch b/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
> deleted file mode 100644
> index 48a6f25..0000000
> --- a/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From b4655b5e7f1e5b87a758dfd7af01a49a40ed148a Mon Sep 17 00:00:00 2001
> -From: Li Zhou <li.zhou@windriver.com>
> -Date: Thu, 10 Oct 2019 15:46:20 +0800
> -Subject: [PATCH] docker-compose: support newer minor version of requests
> -
> -Signed-off-by: Ofek Lev <ofekmeister@gmail.com>
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ----
> - requirements.txt | 2 +-
> - setup.py         | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/requirements.txt b/requirements.txt
> -index 93a0cce..42bde41 100644
> ---- a/requirements.txt
> -+++ b/requirements.txt
> -@@ -16,7 +16,7 @@ pypiwin32==219; sys_platform == 'win32' and python_version < '3.6'
> - pypiwin32==220; sys_platform == 'win32' and python_version >= '3.6'
> - PySocks==1.6.7
> - PyYAML==3.12
> --requests==2.18.4
> -+requests==2.19.1
> - six==1.10.0
> - texttable==0.9.1
> - urllib3==1.21.1
> -diff --git a/setup.py b/setup.py
> -index 422ba54..a74ee0f 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -33,7 +33,7 @@ install_requires = [
> -     'cached-property >= 1.2.0, < 2',
> -     'docopt >= 0.6.1, < 0.7',
> -     'PyYAML >= 3.10, < 4',
> --    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.19',
> -+    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.20',
> -     'texttable >= 0.9.0, < 0.10',
> -     'websocket-client >= 0.32.0, < 1.0',
> -     'docker >= 3.3.0, < 4.0',
> ---
> -1.9.1
> -
> diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
> deleted file mode 100644
> index a7f7b1c..0000000
> --- a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -SUMMARY = "Multi-container orchestration for Docker"
> -HOMEPAGE = "https://www.docker.com/"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
> -
> -SRC_URI += "file://0001-docker-compose-support-newer-minor-version-of-reques.patch"
> -
> -inherit pypi setuptools3
> -
> -SRC_URI[md5sum] = "a243f59b2d286c41ff6ed1c4d4b50996"
> -SRC_URI[sha256sum] = "68b07193755440d5f8d4f47e6f3484212afc255d5b785a81353ea1e9298c1c2c"
> -
> -RDEPENDS_${PN} = "\
> -  ${PYTHON_PN}-cached-property \
> -  ${PYTHON_PN}-certifi \
> -  ${PYTHON_PN}-chardet \
> -  ${PYTHON_PN}-colorama \
> -  ${PYTHON_PN}-docker \
> -  ${PYTHON_PN}-docker-pycreds \
> -  ${PYTHON_PN}-dockerpty \
> -  ${PYTHON_PN}-docopt \
> -  ${PYTHON_PN}-idna \
> -  ${PYTHON_PN}-jsonschema \
> -  ${PYTHON_PN}-pyyaml \
> -  ${PYTHON_PN}-requests \
> -  ${PYTHON_PN}-six \
> -  ${PYTHON_PN}-terminal \
> -  ${PYTHON_PN}-texttable \
> -  ${PYTHON_PN}-urllib3 \
> -  ${PYTHON_PN}-websocket-client \
> -  "
> diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb b/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
> new file mode 100644
> index 0000000..e048acd
> --- /dev/null
> +++ b/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "Multi-container orchestration for Docker"
> +HOMEPAGE = "https://www.docker.com/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "275b32cffdad6b9816dc8b4c7e55600a"
> +SRC_URI[sha256sum] = "2c5fcbfd3ff445b6f3eebb549cb167ef1d8f70c5806aab8f309fc8fa74cd977e"
> +
> +SRC_URI += "file://0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch"
> +
> +RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-cached-property \
> +    ${PYTHON_PN}-certifi \
> +    ${PYTHON_PN}-chardet \
> +    ${PYTHON_PN}-colorama \
> +    ${PYTHON_PN}-docker \
> +    ${PYTHON_PN}-docker-pycreds \
> +    ${PYTHON_PN}-dockerpty \
> +    ${PYTHON_PN}-docopt \
> +    ${PYTHON_PN}-fcntl \
> +    ${PYTHON_PN}-idna \
> +    ${PYTHON_PN}-jsonschema \
> +    ${PYTHON_PN}-misc \
> +    ${PYTHON_PN}-paramiko \
> +    ${PYTHON_PN}-pyyaml \
> +    ${PYTHON_PN}-requests \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-terminal \
> +    ${PYTHON_PN}-texttable \
> +    ${PYTHON_PN}-urllib3 \
> +    ${PYTHON_PN}-websocket-client \
> +"
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4739): https://lists.yoctoproject.org/g/meta-virtualization/message/4739
> Mute This Topic: https://lists.yoctoproject.org/mt/61947254/3618072
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-



--------------88E8EF63227ED23F0E4A7CF0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">1.25.0 requires new version of
      python3-docker.<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 11/26/2019 04:02 AM, Ming Liu wrote:<br>
    </div>
    <blockquote
      cite="mid:1574712153-6498-1-git-send-email-liu.ming50@gmail.com"
      type="cite">
      <pre wrap="">From: Ming Liu <a class="moz-txt-link-rfc2396E" href="mailto:liu.ming50@gmail.com">&lt;liu.ming50@gmail.com&gt;</a>

Signed-off-by: Ming Liu <a class="moz-txt-link-rfc2396E" href="mailto:liu.ming50@gmail.com">&lt;liu.ming50@gmail.com&gt;</a>
---
 ...docker-compose-compatible-with-PyYAML-5.3.patch | 36 ++++++++++++++++++
 ...ose-support-newer-minor-version-of-reques.patch | 44 ----------------------
 .../python3-docker-compose_1.21.2.bb               | 31 ---------------
 .../python3-docker-compose_1.25.0.bb               | 34 +++++++++++++++++
 4 files changed, 70 insertions(+), 75 deletions(-)
 create mode 100644 recipes-containers/docker-compose/files/0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch
 delete mode 100644 recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
 delete mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
 create mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb

diff --git a/recipes-containers/docker-compose/files/0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch b/recipes-containers/docker-compose/files/0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch
new file mode 100644
index 0000000..790648a
--- /dev/null
+++ b/recipes-containers/docker-compose/files/0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch
@@ -0,0 +1,36 @@
+From 10e9b0accbfef93f7d26d1cd470545ad64e370ff Mon Sep 17 00:00:00 2001
+From: Ming Liu <a class="moz-txt-link-rfc2396E" href="mailto:liu.ming50@gmail.com">&lt;liu.ming50@gmail.com&gt;</a>
+Date: Mon, 25 Nov 2019 13:53:11 +0100
+Subject: [PATCH] Make docker-compose compatible with PyYAML &lt; 5.3.
+
+Upstream is not yet using PyYAML 5.1 as they are waiting for the
+final 5.2 release (due api differences that does not affect compose),
+so make it compatible with PyYAML &lt; 5.3 as OE now ships with 5.1.2.
+
+Derives from:
+https://github.com/foundriesio/meta-lmp/commit/117d2d73b9e982dec25f24a2665a1b03a040412f
+
+Upstream-Status: Inappropriate [OE specific]
+
+Ricardo Salveti <a class="moz-txt-link-rfc2396E" href="mailto:ricardo@foundries.io">&lt;ricardo@foundries.io&gt;</a>
+Signed-off-by: Ming Liu <a class="moz-txt-link-rfc2396E" href="mailto:liu.ming50@gmail.com">&lt;liu.ming50@gmail.com&gt;</a>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 23ae08a..8a5f5d0 100644
+--- a/setup.py
++++ b/setup.py
+@@ -32,7 +32,7 @@ def find_version(*file_paths):
+ install_requires = [
+     'cached-property &gt;= 1.2.0, &lt; 2',
+     'docopt &gt;= 0.6.1, &lt; 1',
+-    'PyYAML &gt;= 3.10, &lt; 5',
++    'PyYAML &gt;= 3.10, &lt; 5.3',
+     'requests &gt;= 2.20.0, &lt; 3',
+     'texttable &gt;= 0.9.0, &lt; 2',
+     'websocket-client &gt;= 0.32.0, &lt; 1',
+-- 
+2.7.4
+
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
diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
deleted file mode 100644
index a7f7b1c..0000000
--- a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Multi-container orchestration for Docker"
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://www.docker.com/">"https://www.docker.com/"</a>
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8">"file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"</a>
-
-SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-docker-compose-support-newer-minor-version-of-reques.patch">"file://0001-docker-compose-support-newer-minor-version-of-reques.patch"</a>
-
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = "a243f59b2d286c41ff6ed1c4d4b50996"
-SRC_URI[sha256sum] = "68b07193755440d5f8d4f47e6f3484212afc255d5b785a81353ea1e9298c1c2c"
-
-RDEPENDS_${PN} = "\
-  ${PYTHON_PN}-cached-property \
-  ${PYTHON_PN}-certifi \
-  ${PYTHON_PN}-chardet \
-  ${PYTHON_PN}-colorama \
-  ${PYTHON_PN}-docker \
-  ${PYTHON_PN}-docker-pycreds \
-  ${PYTHON_PN}-dockerpty \
-  ${PYTHON_PN}-docopt \
-  ${PYTHON_PN}-idna \
-  ${PYTHON_PN}-jsonschema \
-  ${PYTHON_PN}-pyyaml \
-  ${PYTHON_PN}-requests \
-  ${PYTHON_PN}-six \
-  ${PYTHON_PN}-terminal \
-  ${PYTHON_PN}-texttable \
-  ${PYTHON_PN}-urllib3 \
-  ${PYTHON_PN}-websocket-client \
-  "
diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb b/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
new file mode 100644
index 0000000..e048acd
--- /dev/null
+++ b/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Multi-container orchestration for Docker"
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://www.docker.com/">"https://www.docker.com/"</a>
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8">"file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"</a>
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "275b32cffdad6b9816dc8b4c7e55600a"
+SRC_URI[sha256sum] = "2c5fcbfd3ff445b6f3eebb549cb167ef1d8f70c5806aab8f309fc8fa74cd977e"
+
+SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch">"file://0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch"</a>
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-cached-property \
+    ${PYTHON_PN}-certifi \
+    ${PYTHON_PN}-chardet \
+    ${PYTHON_PN}-colorama \
+    ${PYTHON_PN}-docker \
+    ${PYTHON_PN}-docker-pycreds \
+    ${PYTHON_PN}-dockerpty \
+    ${PYTHON_PN}-docopt \
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-jsonschema \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-paramiko \
+    ${PYTHON_PN}-pyyaml \
+    ${PYTHON_PN}-requests \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-terminal \
+    ${PYTHON_PN}-texttable \
+    ${PYTHON_PN}-urllib3 \
+    ${PYTHON_PN}-websocket-client \
+"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.

View/Reply Online (#4739): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/4739">https://lists.yoctoproject.org/g/meta-virtualization/message/4739</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/61947254/3618072">https://lists.yoctoproject.org/mt/61947254/3618072</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>  [<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------88E8EF63227ED23F0E4A7CF0--
