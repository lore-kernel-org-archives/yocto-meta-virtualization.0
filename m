Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7492FE00A7B; Mon, 10 Aug 2015 06:52:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.174 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4D7EE007B1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:52:27 -0700 (PDT)
Received: by ykdz80 with SMTP id z80so28057491ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QsKdWcWQMJwDQnBq3MQoqrAA79blV6XVOV2hfFruNbE=;
	b=JGH6PRFBTzRUICBTAtwqicJBAB2nVoBio9eFSZjssL+yCcQJQVU6+XxPQbRdOUCiv0
	XSKqScH+EZD1MRmjpH8qjyfZQCTojxQ6c16oTv70qdL+I5MNQMn6GHjuhoBsFRo568xj
	aXL2wUk/7wo3nLTheRQJfUkFP+uQ6qGKu8lc48L2lY1W+AfFl2O+gETJAga2oGhL84e4
	VdwqhcPl9w7A32KTngDTiP5Yq8OHDyvuCsDvw/U319Fm1YzqdxKNjUklH/qUPgVLiGht
	0/3/m2kQ1iEzFm/gbYTadPyivUwvdV7CZEIekSNIRAiH4bQPWCYLzNgaq8igoVbECVYw
	b+7g==
MIME-Version: 1.0
X-Received: by 10.129.16.215 with SMTP id 206mr20147904ywq.13.1439214747105;
	Mon, 10 Aug 2015 06:52:27 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Mon, 10 Aug 2015 06:52:27 -0700 (PDT)
In-Reply-To: <1438870393-14677-1-git-send-email-mark.asselstine@windriver.com>
References: <1438870393-14677-1-git-send-email-mark.asselstine@windriver.com>
Date: Mon, 10 Aug 2015 09:52:27 -0400
Message-ID: <CADkTA4MU=h_hybVMXcNZaHncKxisU27seMFwcD49f+UsQHR06Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] libvirt: remove sanlock from PACKAGECONFIG
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
X-List-Received-Date: Mon, 10 Aug 2015 13:52:30 -0000
Content-Type: text/plain; charset=UTF-8

merged to master.

Bruce

On Thu, Aug 6, 2015 at 10:13 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> There exists no recipe for sanlock and the libvirt recipe doesn't have
> a sanlock PACKAGECONFIG so removing sanlock from the set of
> PACKAGECONFIGs.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
> index 195633b..874bfd6 100644
> --- a/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
> +++ b/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
> @@ -1,5 +1,5 @@
>  PACKAGECONFIG ?= "qemu lxc test remote macvtap libvirtd udev yajl \
> -                python sanlock ebtables \
> +                python ebtables \
>                  ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>                 "
>
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

