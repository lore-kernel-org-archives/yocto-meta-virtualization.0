Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64852E00A54; Thu, 11 Oct 2018 11:47:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FB6FE00566
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:47:35 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id u21-v6so9160254lja.8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qSXk6893WHLCcM9T+J9h71v0hNng6uEFkwy/uepwxPI=;
	b=dt2vaWPNHPv3IIstCjy7jCzY2PwkW+Wom1hxv1Is9BE0mid7ARXlFxXiZMjtDSqULB
	jSkR4drmfNG79Ox3uWd2HJsqSb65EZTsZHDOoacm2rjyiGGRYnsMfBd/m3cVJ1b17IP9
	D2ILoOWYCJRFTi6BFFHY2Joxc/DzeoPaoBrLDAy+GclBRCzNljVsqpLtQM8Wnnw3fBGR
	BBaHJLFysknEEPuF/zGrwhE4MPK0mzv2bD4im30lPi4LuYKVwV7AOjlpdESe+7xMVhj1
	Op5WtvRn6EtBBQugq3QojRwcNYTO8/p7NgGTMHKVY8X8hPT3yz4YaoyGlf1S1LX5CGb1
	jUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qSXk6893WHLCcM9T+J9h71v0hNng6uEFkwy/uepwxPI=;
	b=UptOtvhrMTqys8BbS+NUP+yUh+pRoLWbYhwB3Sz85txaF2xn1ULPm0XZ+hGFTf3BhX
	3joH5P1b1GTqsbqMAvKW5tIsP4oQXUz2YwKw/WfDDBVcxgpjY9I5zDd/pqjZnRP0TuAw
	s98sLJ/jLY3vAy6+S0S9gh02jcmrXRwAFG0ojfajxqeFLbjuyH80u95e87H4woNWeGe8
	4dcxKELDd4nR2oicGknT37E/s+A6nhsaN3173tgCyH89A+jZAPhOK8HqYPqEyiVg+UVT
	NJBmxLq2KJ+zgAApxf0S/mqlFiumn0T1aHkc6RzPi2dsJ4ke0tIzkB7w90bRNGxletJ4
	nLzw==
X-Gm-Message-State: ABuFfohS8CGpzXiIAOAGl/NdzXZNNLhYlbAz+zvW/3wGioDlHnmz2lBI
	yRDAYwNtWGJxnAG4LlV1x+KkvDJSDRTIOCkfWds=
X-Google-Smtp-Source: ACcGV626qTbmp3XHyns67+JM3TXE1y43C1NWsmoE43F6moHess7lCd+Ge0PBDnX3rN6p/6G18tGVk1VFFD0k1vL3tqs=
X-Received: by 2002:a2e:8ec6:: with SMTP id
	e6-v6mr1757668ljl.166.1539283653961; 
	Thu, 11 Oct 2018 11:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <1539229819-322989-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1539229819-322989-1-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Oct 2018 14:47:23 -0400
Message-ID: <CADkTA4MrEE+TgU9Mb=jFXKk6sPkS=8-UYTm3XnWSde36rZG80w@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-openstack][PATCH 1/3] sanity-meta-openstack.bbclass: add class for bbappend files checking
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
X-List-Received-Date: Thu, 11 Oct 2018 18:47:43 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Note: this doesn't apply to my meta-openstack layer. So it was based
on some version that I don't have. But since the change was simple
enough, I resolved the issue and did the merge.

Bruce
On Wed, Oct 10, 2018 at 11:50 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Add a new class sanity-meta-openstack.bbclass,
> to check whether necessary settings are available
> for bbappend files and preferred version setting
> in this layer to be effective and warn users if not.
>
> In addition, a variable SKIP_SANITY_META_OPENSTACK_CHECK
> is added to enable users to explicitly skip the
> checking to avoid unwanted warnings.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta-openstack/README                                | 19 +++++++++++++++++++
>  meta-openstack/classes/sanity-meta-openstack.bbclass | 10 ++++++++++
>  meta-openstack/conf/layer.conf                       |  4 ++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 meta-openstack/classes/sanity-meta-openstack.bbclass
>
> diff --git a/meta-openstack/README b/meta-openstack/README
> index 81b843b..8506250 100644
> --- a/meta-openstack/README
> +++ b/meta-openstack/README
> @@ -5,6 +5,25 @@ This layer provides support for building the packages from the OpenStack project
>  The layer contains recipes for the nova, glance, keystone, cinder, quantum, swift
>  and horizon components.
>
> +The bbappend files for some recipes (e.g. postgresql) and preferred version setting
> +(e.g. python-networkx)in this layer need to have 'openstack' in DISTRO_FEATURES to
> +have effect. To enable them, add in configuration file the following line.
> +
> +  DISTRO_FEATURES_append = " openstack"
> +
> +If meta-openstack is included, but openstack is not enabled as a
> +distro feature a warning is printed at parse time:
> +
> +    You have included the meta-openstack layer, but
> +    'openstack' has not been enabled in your DISTRO_FEATURES. Some bbappend files
> +    and preferred version setting may not take effect. See the meta-openstack README
> +    for details on enabling openstack support.
> +
> +If you know what you are doing, this warning can be disabled by setting the following
> +variable in your configuration:
> +
> +  SKIP_META_OPENSTACK_SANITY_CHECK = 1
> +
>  Dependencies
>  ------------
>
> diff --git a/meta-openstack/classes/sanity-meta-openstack.bbclass b/meta-openstack/classes/sanity-meta-openstack.bbclass
> new file mode 100644
> index 0000000..3d5e57b
> --- /dev/null
> +++ b/meta-openstack/classes/sanity-meta-openstack.bbclass
> @@ -0,0 +1,10 @@
> +addhandler openstack_bbappend_distrocheck
> +openstack_bbappend_distrocheck[eventmask] = "bb.event.SanityCheck"
> +python openstack_bbappend_distrocheck() {
> +    skip_check = e.data.getVar('SKIP_META_OPENSTACK_SANITY_CHECK') == "1"
> +    if 'openstack' not in e.data.getVar('DISTRO_FEATURES').split() and not skip_check:
> +        bb.warn("You have included the meta-openstack layer, but \
> +'openstack' has not been enabled in your DISTRO_FEATURES. Some bbappend files \
> +and preferred version setting may not take effect. See the meta-openstack README \
> +for details on enabling openstack support.")
> +}
> diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
> index 126f37f..f322bcd 100644
> --- a/meta-openstack/conf/layer.conf
> +++ b/meta-openstack/conf/layer.conf
> @@ -35,5 +35,9 @@ PREFERRED_VERSION_python-jsonschema = "2.6.0"
>  PREFERRED_VERSION_python-networkx = "1.11"
>  PREFERRED_VERSION_python-oslo.i18n = "3.17.0+gitAUTOINC+f2729cd36f"
>
> +# Sanity check for meta-openstack layer.
> +# Setting SKIP_META_OPENSTACK_SANITY_CHECK to "1" would skip the bbappend files check.
> +INHERIT += "sanity-meta-openstack"
> +
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  LAYERRECOMMENDS_openstack-layer = "meta-openstack-dl (= 2.6)"
> --
> 2.7.4
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

