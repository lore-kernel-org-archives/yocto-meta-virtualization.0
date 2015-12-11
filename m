Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3BA75E00B97; Fri, 11 Dec 2015 09:17:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF90BE0097F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 09:17:57 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBBHHuVY022103
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 09:17:56 -0800
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 11 Dec 2015 09:17:55 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1449679461-4787-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <566B0538.4060502@windriver.com>
Date: Fri, 11 Dec 2015 12:17:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1449679461-4787-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-django: uprev to 1.8.6
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Dec 2015 17:17:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-12-09 11:44 AM, Mark Asselstine wrote:
> Move to use git to ease future uprevs. Note that a recipe for django
> exists in meta-python and since it is a versioned recipe instead of a
> "_git" recipe it seems to be picked up instead of our recipe, so we
> need to add a PREFERRED_VERSION to ensure our recipe is used.

merged.

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   meta-openstack/conf/layer.conf                                |  1 +
>   .../python/{python-django_1.7.5.bb => python-django_git.bb}   | 11 ++++++-----
>   2 files changed, 7 insertions(+), 5 deletions(-)
>   rename meta-openstack/recipes-devtools/python/{python-django_1.7.5.bb => python-django_git.bb} (51%)
>
> diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
> index 2b3a00d..f0d42b8 100644
> --- a/meta-openstack/conf/layer.conf
> +++ b/meta-openstack/conf/layer.conf
> @@ -14,3 +14,4 @@ BB_DANGLINGAPPENDS_WARNONLY ?= "true"
>   PREFERRED_VERSION_python-greenlet = "0.4.1"
>   PREFERRED_VERSION_python-sqlalchemy = "0.9.7"
>   PREFERRED_VERSION_python-pexpect = "3.3"
> +PREFERRED_VERSION_python-django = "1.8.6"
> diff --git a/meta-openstack/recipes-devtools/python/python-django_1.7.5.bb b/meta-openstack/recipes-devtools/python/python-django_git.bb
> similarity index 51%
> rename from meta-openstack/recipes-devtools/python/pythongit-django_1.7.5.bb
> rename to meta-openstack/recipes-devtools/python/python-django_git.bb
> index b462e4d..f11f8e6 100644
> --- a/meta-openstack/recipes-devtools/python/python-django_1.7.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-django_git.bb
> @@ -6,13 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
>
>   SRCNAME = "Django"
>
> -SRC_URI = "https://pypi.python.org/packages/source/D/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -"
> +PV = "1.8.6"
> +SRCREV = "80b7e9d09f2d23209b591288f9b2cf3eb3d927c8"
>
> -SRC_URI[md5sum] = "e76c70a5dd7d56a511974b28ab38df20"
> -SRC_URI[sha256sum] = "1c391f9349c97df503dac3461599f24235e4d04393498e6060e74dd2721460bc"
> +SRC_URI = " \
> +    git://github.com/django/django.git;branch=stable/1.8.x \
> +    "
>
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> +S = "${WORKDIR}/git"
>
>   inherit setuptools
>
>


