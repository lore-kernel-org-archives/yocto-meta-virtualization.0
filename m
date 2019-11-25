Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.2218.1574714802064694703
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 12:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fHj/6T9R;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id m13so14028011edv.9
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Nov 2019 12:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W+l2s67has5ILv/kVBVQuuYgWq8TJVjYBYHBkJCuimo=;
        b=fHj/6T9R3ia7jU0+Wv+TA4DdLvKuUQRcwyKtoDwxSTEfgb3fhFzubUAKUuF6NRA7/E
         2q3Sw5t0YnPkFY3CAQ/avlmLVycROSfAnHpxQXP9V7xWMmxZy/+5GP/4i26MtJTwt4Va
         SkmhYniXRXIMyclDuUL2752kpkmdAz/6Ravs82XezA1zHLC+fx5DMUwJfe4X0TXLsEja
         aVGf9qUImB8FEy6SuumRueU14xKnJI2yBEAJFM8cTfg5NLVt2zpLRtzVUEbZiZt49mLO
         C3nJySe/LdeO1kuxRZyCy1YredOrnDMp4sR3ofXD+qsC+evMC1LgFGRid7+SgZZdT5F5
         rAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W+l2s67has5ILv/kVBVQuuYgWq8TJVjYBYHBkJCuimo=;
        b=Rym8AQL+Vv2hyoQHLnq+h9TIHCjuy2O1Mj3f5Nrwxw3Nshq8ZNTxSoEWfftOgetrsD
         Iv5A81lW5voLcW66nCK4ep7JS4XZ+2fHNoVvreWzGxF/vxC2VJljTmx6s1iwSf995SrH
         bauAZDxCZehSClInufnPvXKwbzkuPGv3T8ZqzZGIJo3unoYEnL61ZLwxGxj/7ZOnNXXh
         MfxGS/7FsOOT7LE7dgDclvGFzpltHaZI8QGhgX8tK8jtljU0c9iP1H9deGSEkEGCuoVT
         u+bgmRRn2p578uoFNsHKPBaecsRYtp/eY0/PcbqKrlPryeZaOxQUMqYyFU5t6sXw5NgK
         yw7A==
X-Gm-Message-State: APjAAAVvINfdIanZZD8vyE18o7RdOhXLsffEeyRdCfix/39mZo1dYwWp
	shJQHVvtoPgUeQweTnWbQAwsN7u/h3vfIg2bRZo=
X-Google-Smtp-Source: APXvYqw/efiPiyhDQFHVzK07uOdMz2kszpj9OQsHBZcQQ5TBQQmRHrZS6HRGjHYW4LJW2oCcZjQW5ixqRNXTTh83yDY=
X-Received: by 2002:a50:baa9:: with SMTP id x38mr20615059ede.106.1574714800326;
 Mon, 25 Nov 2019 12:46:40 -0800 (PST)
MIME-Version: 1.0
References: <1574712153-6498-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1574712153-6498-1-git-send-email-liu.ming50@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 25 Nov 2019 15:46:29 -0500
Message-ID: <CADkTA4Mu1QH+pbMtkiiwt0BQgOk4LWYbqF0rBAeB2FTbMQc7pg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-compose: uprev to 1.25.0
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Stefan Agner <stefan.agner@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 25, 2019 at 3:02 PM Ming Liu <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <liu.ming50@gmail.com>

Can we get a summary of the changes between the revisions here in the
long log ? It's useful to have in the git history.

>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  ...docker-compose-compatible-with-PyYAML-5.3.patch | 36 ++++++++++++++++++
>  ...ose-support-newer-minor-version-of-reques.patch | 44 ----------------------
>  .../python3-docker-compose_1.21.2.bb               | 31 ---------------
>  .../python3-docker-compose_1.25.0.bb               | 34 +++++++++++++++++

Can you regenerate the patch with -M ? That way we can easily see if
there are any deltas in the recipe itself.

>  4 files changed, 70 insertions(+), 75 deletions(-)
>  create mode 100644 recipes-containers/docker-compose/files/0001-Make-docker-compose-compatible-with-PyYAML-5.3.patch
>  delete mode 100644 recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
>  delete mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
>  create mode 100644 recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
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

You mentioned above that the change "derives from" .. If this isn't
exactly the patch, then don't add someone else's Signed-off-by. You've
already given credit by linking to the upstream patch, so you don't
need the signed-off-by.

Bruce

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
> --
> 2.7.4
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4739): https://lists.yoctoproject.org/g/meta-virtualization/message/4739
> Mute This Topic: https://lists.yoctoproject.org/mt/61947254/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
