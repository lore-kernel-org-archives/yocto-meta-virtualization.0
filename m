Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23EDFE00B46; Wed, 14 Oct 2015 07:35:47 -0700 (PDT)
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
	*      [209.85.160.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BBDAE00B43
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Oct 2015 07:35:44 -0700 (PDT)
Received: by ykey125 with SMTP id y125so48971426yke.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Oct 2015 07:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RjVZQ9uh6whY8o8cHgqdEWYDD//H+yS6Fs+f/24401s=;
	b=HWPP2ctnz9gxoOPk0hhotPCbq2v/dKmnZdxsj57oSsKy04cTtFIxAiiDrM7ztg7pRG
	KHBqlKoXPJUElhvNcyB/c8/2JEJpOFNlvXH9aDplJIeQltErbyGyIkl8ALp6WRFjOuZk
	mcV3gsnGdvpBAQp3QPIBXs4TWX9zG8A02tiUUEnihmT7QYIzJplh42Qe5NSF2UAlKE4q
	8S8o579L4VL1aZG1U/wKtmVbZELY3CSihAcAeONDgsxwXJPO58R8wDLRIVwImKpAc3gn
	dAWP69gxRKgfikUhfSBApkXIRjBpFZb9XZWvNLQRw14vVpJIiA+l34FVMTtOJ1ULuJ+d
	yFeQ==
MIME-Version: 1.0
X-Received: by 10.13.225.9 with SMTP id k9mr2861367ywe.320.1444833344356; Wed,
	14 Oct 2015 07:35:44 -0700 (PDT)
Received: by 10.13.217.201 with HTTP; Wed, 14 Oct 2015 07:35:44 -0700 (PDT)
In-Reply-To: <1444784792-19233-1-git-send-email-mark.asselstine@windriver.com>
References: <1444784792-19233-1-git-send-email-mark.asselstine@windriver.com>
Date: Wed, 14 Oct 2015 10:35:44 -0400
Message-ID: <CADkTA4NOy8NuBRZU_Me9d24zhA58k5TK1K6fRWqJohTRz-hkAQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] dhcp: bbappend to use PN
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
X-List-Received-Date: Wed, 14 Oct 2015 14:35:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 13, 2015 at 9:06 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> From: Vu Tran <vu.tran@windriver.com>
>
> Fix the following warning:

merged.

Bruce

>
> WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient
> ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf
> ${base_sbindir}/dhclient-systemd-wrapper) replaces original key
> FILES_dhcp-client ( ${sysconfdir}/dhcp/dhclient-exit-hooks).
>
> Signed-off-by: Vu Tran <vu.tran@windriver.com>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-connectivity/dhcp/dhcp_%.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-connectivity/dhcp/dhcp_%.bbappend b/recipes-connectivity/dhcp/dhcp_%.bbappend
> index a23f7c9..7466056 100644
> --- a/recipes-connectivity/dhcp/dhcp_%.bbappend
> +++ b/recipes-connectivity/dhcp/dhcp_%.bbappend
> @@ -12,5 +12,5 @@ do_install_append () {
>
>  }
>
> -FILES_dhcp-client += "${sysconfdir}/dhcp/dhclient-exit-hooks \
> +FILES_${PN}-client += "${sysconfdir}/dhcp/dhclient-exit-hooks \
>                       "
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

