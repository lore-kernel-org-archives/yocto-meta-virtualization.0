Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4BCF0E00BE9; Wed,  9 Dec 2015 08:52:35 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D623E00AD8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Dec 2015 08:52:31 -0800 (PST)
Received: by wmww144 with SMTP id w144so230904929wmw.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 09 Dec 2015 08:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=3lTKl7+0TxjV0smwZW5JVr4GCFTGKRBzix0Tx0bn4dc=;
	b=M2qBmtBzF8OIKOo08TF4ol4bZnFJiU0KtibQ052MDEbAA3ce2qzfJ0ZA4gHdQyCerJ
	S9QLJdL8tJmjO0Gjo1hEBVKT/5jRPIUEcHsNJUgwlw2wHyONDNy+5ysOwlrDRWn+liTO
	WIutezhb/0LXPAfPeBO6p9h0a3SgqHsFRtdsf62j8LQy3xaxNwhyPybox5iqEOCU9uPs
	psnyWRho0TZS6aBn0z1HhjZZ0dRK3rxtZAooRi104jJBw1Ax0FNOwb/XBtthMvS7Y0dy
	HE3NfDBSGs2M1oZny5t6gDbL1Y6C+avdV24EAvcWGlmS27/6/wg4BmvG5P6cyGJClgkW
	AFRw==
MIME-Version: 1.0
X-Received: by 10.194.175.230 with SMTP id cd6mr7976186wjc.100.1449679950939; 
	Wed, 09 Dec 2015 08:52:30 -0800 (PST)
Sender: asselsm@gmail.com
Received: by 10.194.59.176 with HTTP; Wed, 9 Dec 2015 08:52:30 -0800 (PST)
In-Reply-To: <1449679461-4787-1-git-send-email-mark.asselstine@windriver.com>
References: <1449679461-4787-1-git-send-email-mark.asselstine@windriver.com>
Date: Wed, 9 Dec 2015 11:52:30 -0500
X-Google-Sender-Auth: Gcp0dnOjN-8wjHQ3Vk4LHlEc2hc
Message-ID: <CAPuovELXOinuBaDHrASjs7d+g4_X9te96jEsOnvEkGiMZO5ZSw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] python-django: uprev to 1.8.6
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Dec 2015 16:52:35 -0000
Content-Type: text/plain; charset=UTF-8

Note that this is the first of *many* changes I will be sending to
move master to the point where the liberty release has been forked. At
the end of it all we will be able to create a liberty branch and both
master and liberty can evolve from there.

I have most of the needed changes staged for this transition and
things are mostly working so I will start organizing my changes and
getting reviews out over the next week or so. I can't promise that
master won't be broken at times and that things will be bisect-able
throughout the series but I will try my best to keep things working
from commit to commit.

I will also try to leverage commits Josep and others have made on the
other branches. If I happen to miss a change someone already made on
another branch and thus duplicate their work I apologize in advance.
Trust me I don't want to duplicate any work so this would only happen
accidentally.

Regards,
Mark

On Wed, Dec 9, 2015 at 11:44 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Move to use git to ease future uprevs. Note that a recipe for django
> exists in meta-python and since it is a versioned recipe instead of a
> "_git" recipe it seems to be picked up instead of our recipe, so we
> need to add a PREFERRED_VERSION to ensure our recipe is used.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-openstack/conf/layer.conf                                |  1 +
>  .../python/{python-django_1.7.5.bb => python-django_git.bb}   | 11 ++++++-----
>  2 files changed, 7 insertions(+), 5 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-django_1.7.5.bb => python-django_git.bb} (51%)
>
> diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
> index 2b3a00d..f0d42b8 100644
> --- a/meta-openstack/conf/layer.conf
> +++ b/meta-openstack/conf/layer.conf
> @@ -14,3 +14,4 @@ BB_DANGLINGAPPENDS_WARNONLY ?= "true"
>  PREFERRED_VERSION_python-greenlet = "0.4.1"
>  PREFERRED_VERSION_python-sqlalchemy = "0.9.7"
>  PREFERRED_VERSION_python-pexpect = "3.3"
> +PREFERRED_VERSION_python-django = "1.8.6"
> diff --git a/meta-openstack/recipes-devtools/python/python-django_1.7.5.bb b/meta-openstack/recipes-devtools/python/python-django_git.bb
> similarity index 51%
> rename from meta-openstack/recipes-devtools/python/python-django_1.7.5.bb
> rename to meta-openstack/recipes-devtools/python/python-django_git.bb
> index b462e4d..f11f8e6 100644
> --- a/meta-openstack/recipes-devtools/python/python-django_1.7.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-django_git.bb
> @@ -6,13 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
>
>  SRCNAME = "Django"
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
>  inherit setuptools
>
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

