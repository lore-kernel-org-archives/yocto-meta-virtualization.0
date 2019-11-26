Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.5395.1574731282035363118
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 17:21:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dsSaRcr6;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DCD8FE00E5C; Mon, 25 Nov 2019 17:21:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 695B1E00B7A
	for <meta-virtualization@yoctoproject.org>; Mon, 25 Nov 2019 17:21:20 -0800 (PST)
Received: by mail-ed1-f67.google.com with SMTP id s10so14748997edi.5
        for <meta-virtualization@yoctoproject.org>; Mon, 25 Nov 2019 17:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=temlyNvl6k/MM52E/gIkpXDb1nPVkiIC0VB0CPe3dlQ=;
        b=dsSaRcr6g4grv9vDk08KQpOJf3NP31JSnRLExtDUJ9K2pJDxEhaWjVz0mEdRC/W4ea
         ZRTuowuE7FsMuPAkHiXSrn1pnnS+zYueYQjKQ/pLVjdJAH6zHEFbVtktZksMxqy8U6rd
         RUC5PwNQG7YIEFjMDwkxpsESoh+6QVM0QrOYUXi81IpgsUdIGuv9f2w2/dVxDFchSPUl
         7mSzRpa6OZWs/mTMDejmDfI+vI3mCSpL3QqGLbNSApZUx6eXF6iTSMdMtu+a7fS7kOSN
         OvunVaEaP5p8ntKuuDYiCk5lRu1opnSs62VT9NpEZbyWfKtyQ577BOwUXz5hnzc4sKRK
         2YsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=temlyNvl6k/MM52E/gIkpXDb1nPVkiIC0VB0CPe3dlQ=;
        b=oHOy6PzVcPiu4+IC7M9Srqp3l41XXmg7oZkprUwjylWRlEcQZzDKB4hoS966pm/ukT
         XVQ5H1zdTvvD9DMCYdXoEf+50XQd65CmY4Im7HZrCsfx5O+Bipgz5YXKC9fM7UzLVyZf
         KPJ9QG9AkfJe2Am+R+hDKgxFPkrdRg/PbAZFy0BF+OqIyFMDHByM6kEWZxnn0Joz3QWr
         3yGum/kfjPs8oLYtZmkVIeGCaOxFlgkciukbmv46EFRis0w56LSnM4h7VnBLANG6hcb0
         XR+FhMPerZMgjsPLp9KajpAc1UC9JtsEd44EOzgvgy2cyppaRBt2V2XL0jY28h9RqtHc
         Zc3w==
X-Gm-Message-State: APjAAAW23UDOuS3Ia2Kuvb4qMAZT84IkfsIGZbVrloZLXdXebQER/rHK
	jaqDpmnx/q0ShCKHX8CaIHe0+a/jyzeuw0b5uWM=
X-Google-Smtp-Source: APXvYqwGFkvB5D3fyISY/SxsCGlis854GxQiS9oNOMBbnR0wspqlv9oNjEc12DPbnx//yHxXM53/HMG2B3Y60ZDxX/Y=
X-Received: by 2002:a50:baa9:: with SMTP id x38mr21810490ede.106.1574731279142;
 Mon, 25 Nov 2019 17:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20191122074510.1992-1-Qi.Chen@windriver.com> <20191125211220.GA28355@gmail.com>
 <d18614ca-6630-2c7a-dc24-f6708a4b144e@windriver.com>
In-Reply-To: <d18614ca-6630-2c7a-dc24-f6708a4b144e@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 25 Nov 2019 20:21:08 -0500
Message-ID: <CADkTA4OqP2s1CiVV2cRtGQnU6KosHm_BJhBu4uEgGvY+WEV04A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] python3-docker-compose: remove maximum version requirements
To: ChenQi <Qi.Chen@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, Ming Liu <liu.ming50@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 25, 2019 at 8:17 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> On 11/26/2019 05:12 AM, Bruce Ashfield wrote:
>
> In message: [meta-virtualization][PATCH] python3-docker-compose: remove maximum version requirements
> on 22/11/2019 Chen Qi wrote:
>
> Remove maximum version requirements for docker-compose so that it
> does not require old version recipes.
>
> Which oe-core versions of the packages are newer than the maximum values
> listed in docer compose ?
>
> I'd like to log that in this commit log .. since that is the justification
> for the patch.
>
> Bruce
>
>
> Hi Bruce,
>
> I've sent out V2 adding the information. Totally, it's 5 old recipes that are needed.
>
> @Ming, I hope your upgrade to 1.25 could also rebase on this patch if it's merged.
> Because meta-python usually upgrades the packages to latest versions, and we will soon meet the same problem.
>
> Bruce, I have communicated with docker-compose upstream, they have confirmed that they will not remove the maximum version constraints. See https://github.com/docker/compose/issues/7024.
>

thanks for the link, and the effort to get it resolved upstream!

I'll merge v2 shortly.

Bruce

> Best Regards,
> Chen Qi
>
> The current one has been tested against https://docs.docker.com/compose/gettingstarted/.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...upport-newer-minor-version-of-reques.patch | 44 --------------
>  ...-remove-maximum-version-requirements.patch | 58 +++++++++++++++++++
>  .../python3-docker-compose_1.21.2.bb          |  2 +-
>  3 files changed, 59 insertions(+), 45 deletions(-)
>  delete mode 100644 recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
>  create mode 100644 recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
>
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
> diff --git a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
> new file mode 100644
> index 0000000..54835ff
> --- /dev/null
> +++ b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
> @@ -0,0 +1,58 @@
> +From 2685716409c560cdf94aee6262ed8c32ad137133 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Fri, 22 Nov 2019 09:24:58 +0800
> +Subject: [PATCH] setup.py: remove maximum version requirements
> +
> +Remove maximum version requirements so that docker-compose will not
> +require old version recipes.
> +
> +Upstream-Status: Inappropriate [OE Specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + setup.py | 22 +++++++++++-----------
> + 1 file changed, 11 insertions(+), 11 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 422ba54..c2b4556 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -30,16 +30,16 @@ def find_version(*file_paths):
> +
> +
> + install_requires = [
> +-    'cached-property >= 1.2.0, < 2',
> +-    'docopt >= 0.6.1, < 0.7',
> +-    'PyYAML >= 3.10, < 4',
> +-    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.19',
> +-    'texttable >= 0.9.0, < 0.10',
> +-    'websocket-client >= 0.32.0, < 1.0',
> +-    'docker >= 3.3.0, < 4.0',
> +-    'dockerpty >= 0.4.1, < 0.5',
> +-    'six >= 1.3.0, < 2',
> +-    'jsonschema >= 2.5.1, < 3',
> ++    'cached-property >= 1.2.0',
> ++    'docopt >= 0.6.1',
> ++    'PyYAML >= 3.10',
> ++    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0',
> ++    'texttable >= 0.9.0',
> ++    'websocket-client >= 0.32.0',
> ++    'docker >= 3.3.0',
> ++    'dockerpty >= 0.4.1',
> ++    'six >= 1.3.0',
> ++    'jsonschema >= 2.5.1',
> + ]
> +
> +
> +@@ -56,7 +56,7 @@ extras_require = {
> +     ':python_version < "3.5"': ['backports.ssl_match_hostname >= 3.5'],
> +     ':python_version < "3.3"': ['ipaddress >= 1.0.16'],
> +     ':sys_platform == "win32"': ['colorama >= 0.3.9, < 0.4'],
> +-    'socks': ['PySocks >= 1.5.6, != 1.5.7, < 2'],
> ++    'socks': ['PySocks >= 1.5.6, != 1.5.7'],
> + }
> +
> +
> +--
> +2.17.1
> +
> diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
> index a7f7b1c..a895005 100644
> --- a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
> +++ b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://www.docker.com/"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
>
> -SRC_URI += "file://0001-docker-compose-support-newer-minor-version-of-reques.patch"
> +SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch"
>
>  inherit pypi setuptools3
>
> --
> 2.17.1
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4733): https://lists.yoctoproject.org/g/meta-virtualization/message/4733
> Mute This Topic: https://lists.yoctoproject.org/mt/61564429/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
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
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
