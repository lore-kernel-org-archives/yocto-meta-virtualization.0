Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0698E0093F; Wed,  8 Feb 2017 06:38:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.195 listed in dnsbl.sorbs.net]
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F507E0092C
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Feb 2017 06:38:03 -0800 (PST)
Received: by mail-yb0-f195.google.com with SMTP id o65so6215186ybo.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 08 Feb 2017 06:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u88xJB9eiraDXhpXluwOkBXU7g/UKv/z0HKu3xhGeLM=;
	b=UVF2vTtbLPQjLNh9CHDg3+jbU3kAWbDLjDMd7NBjOrzbDoRCJIy90ov9n2SghgDMcs
	ZnGG6cQ5bmrM87aDW1FEE/YY0S4ZlhQlS5awGKqhtyBVS6mGdBX8S+532W8XjThn+ahk
	+NvlMV9/F7/BJfrMjEHyBbzwjCss99DlvZ6BGLgGQtM7TcJEE4wxQBdfRFeAlsPftKqd
	yzuf/6Di8UXsD9/HtRlJGak/y3eX1Gg/xUg/p+dMmt/7oCsn3CfHw1dz2Z5DS5rnAF6p
	88L8LQID/q0JgwAc0mrnaC+T14uK3z435A/McK8upKr11ExeskYpiW4Pd/kmBAvZXYz6
	oWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=u88xJB9eiraDXhpXluwOkBXU7g/UKv/z0HKu3xhGeLM=;
	b=fNxYiqi30jB+K/RFEtQ11HmpbwE06jCensyqUD6S1/Uxzt1q3D/HIEqXN6AEBSkHZg
	9N3f6OZiuIvncse5bTu+39PBS7YB6Ds5BmmxN5/KN9SdkDubccqEMEDUJk6d1fMIDPAl
	dn2QK894U6d8H4kEjSJkzIIC8iwhn7fZlAcm8+I+eqy7pzRNnB+5RGWCH9vGLDVAHucG
	YewsCfqoB/8HXfYL/GcAcWbh0jXfT1CwaziyZwjmexYNmmz46uRA1FfjUgS6YFmqyQ8R
	2bN6b/3nzou1W+AuwbyvGU/v7JwQm/Dy6hYi48PRi/ec1Fq/lSxRIoEFUNraDsfx4eD7
	6Jdw==
X-Gm-Message-State: AMke39mrBLXb3QbfF+Oj9PYItFPQFYOiGKlzlakS6+qe06cLiX82ClQOg6F+XEsAJgA/2ySSSLIXrUAjb1QUVw==
X-Received: by 10.37.177.167 with SMTP id h39mr15200119ybj.110.1486564683078; 
	Wed, 08 Feb 2017 06:38:03 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.21.66 with HTTP; Wed, 8 Feb 2017 06:38:02 -0800 (PST)
In-Reply-To: <48deae3a-974f-406e-4091-7476397847aa@intel.com>
References: <1486561594-24053-1-git-send-email-amarnath.valluri@intel.com>
	<1486561594-24053-4-git-send-email-amarnath.valluri@intel.com>
	<CAPuovEJs8vWHca-GW5aMj29PXXyPn3qPAmNpZ7ESRJYxqznmbA@mail.gmail.com>
	<48deae3a-974f-406e-4091-7476397847aa@intel.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 8 Feb 2017 09:38:02 -0500
X-Google-Sender-Auth: 59Cr6z7Hz7KMiTpeg5IGCWX1mZc
Message-ID: <CAPuovELXFbEM73mW8zg1OaOAS+=oVMKJipP8GLBwbuTCH2TOSQ@mail.gmail.com>
To: avalluri <amarnath.valluri@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 4/4] libvirt: Replace systemd units location to match with bitbake environment.
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
X-List-Received-Date: Wed, 08 Feb 2017 14:38:05 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2017 at 9:37 AM, avalluri <amarnath.valluri@intel.com> wrote:
>
>
> On 08.02.2017 16:15, Mark Asselstine wrote:
>
> On Wed, Feb 8, 2017 at 8:46 AM, Amarnath Valluri
> <amarnath.valluri@intel.com> wrote:
>
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  recipes-extended/libvirt/libvirt_1.3.5.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb
> b/recipes-extended/libvirt/libvirt_1.3.5.bb
> index c848c99..206f59f 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
> @@ -213,6 +213,12 @@ PACKAGECONFIG[wireshark] =
> "--with-wireshark-dissector,--without-wireshark-disse
>  # Enable the Python tool support
>  require libvirt-python.inc
>
> +do_configure_prepend() {
> +       systemd_system_unitdir="${@d.getVar('systemd_system_unitdir')}"
> +       sed -i -e "s;^SYSTEMD_UNIT_DIR =.*;SYSTEMD_UNIT_DIR =
> $systemd_system_unitdir;" \
> +            ${S}/daemon/Makefile.am ${S}/src/Makefile.am
> ${S}/tools/Makefile.am
>
> The others patches look fine but for this one is there no way to pass
> the value to make? I almost prefer to have this taken care of via a
> patch to the source instead of sed expressions here.
>
> Its value is hard coded in Makefile.am, one thing we can do is to patch the
> configure.ac to make systemd unit dir configurable from outside. I can send
> the V2 with this change.

I prefer that approach. Looking forward to the v2.

Mark

>
> -Amarnath
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

