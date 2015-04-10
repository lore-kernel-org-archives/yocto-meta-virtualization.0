Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD20BE00954; Thu,  9 Apr 2015 22:03:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.179 listed in list.dnswl.org]
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92648E008F6
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Apr 2015 22:02:58 -0700 (PDT)
Received: by iebrs15 with SMTP id rs15so9093331ieb.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 09 Apr 2015 22:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=F86+H2xZj8kaLhVbRbgnauAynUrviqPYGeNQAJEJa7o=;
	b=cxVr6+9cpJGAcg4XhMv95KHw9pAvRdzMPVnUsyYNxe+ba4fAfiBj7b0gXr6aK0N3Ba
	lmkBUWn6JaHFznyhHWGv2zHN8Pys4S+RemAQo8647yv4PjH9N4oqATMPHdKgypr02DID
	HkLG2DOM79kZCcM+lyuzJukhWUHhSLcqOIDiyCccu7+cnA6tk3NLhJSaUhNLqGNZJo0H
	RGX6/RvYK7kCAGRXv8kd7jK9iMqQ7mXdohxrstFJGhWa8TgXRxrefCp+rTmJ6l0USfUN
	AuOuHBI84kRwuyskFNSWpCa8TruIOybPwo3rwtEzq8Lo9y5yEqVFS1lhpAoWoR6JyXKj
	if7w==
MIME-Version: 1.0
X-Received: by 10.50.171.130 with SMTP id au2mr25581537igc.28.1428642178103;
	Thu, 09 Apr 2015 22:02:58 -0700 (PDT)
Received: by 10.107.158.20 with HTTP; Thu, 9 Apr 2015 22:02:58 -0700 (PDT)
In-Reply-To: <1428609708-15379-2-git-send-email-dmitry_eremin@mentor.com>
References: <1428609708-15379-1-git-send-email-dmitry_eremin@mentor.com>
	<1428609708-15379-2-git-send-email-dmitry_eremin@mentor.com>
Date: Fri, 10 Apr 2015 01:02:58 -0400
Message-ID: <CADkTA4NmrB8tonUh6tdrkjBB2vUz6dQztKXax7qMsBNGwW=Gog@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/3] lxc: include systemd files into lxc-setup
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
X-List-Received-Date: Fri, 10 Apr 2015 05:03:04 -0000
Content-Type: text/plain; charset=UTF-8

systemd and lxc are broken in quite a few ways at the moment. I've just
finished fixing things up, so I tossed this on the queue and will push all
the changes shortly.

Bruce

On Thu, Apr 9, 2015 at 4:01 PM, Dmitry Eremin-Solenikov
<dmitry_eremin@mentor.com> wrote:
> lxc-setup package accumulates all initscripts, so it should also include
> systemd service files.
>
> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
> ---
>  recipes-containers/lxc/lxc_1.0.7.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
> index c9eef75..1c70958 100644
> --- a/recipes-containers/lxc/lxc_1.0.7.bb
> +++ b/recipes-containers/lxc/lxc_1.0.7.bb
> @@ -72,6 +72,7 @@ RDEPENDS_${PN}-templates += "bash"
>
>  FILES_${PN}-setup += "/etc/tmpfiles.d"
>  FILES_${PN}-setup += "/lib/systemd/system"
> +FILES_${PN}-setup += "/usr/lib/systemd/system"
>  FILES_${PN}-setup += "/etc/init.d"
>
>  PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
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

