Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D00ABE00D1B; Sun, 24 Mar 2019 20:15:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.167.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 238C7E0091D
	for <meta-virtualization@yoctoproject.org>;
	Sun, 24 Mar 2019 20:15:39 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id b7so345647lfg.9
	for <meta-virtualization@yoctoproject.org>;
	Sun, 24 Mar 2019 20:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9HK1uGp4QNWG6xYykWSTB/022BO+CGfiLue16A2x8gk=;
	b=qANNnV28GjspQ6yiqdwTwmCwkZfv6sWaF3Ua35tffKw08yx+JPodqZLRqRzLA0zyKG
	7y9anpCdI+NvgbzXP/s3edRNeTWpnPxB1bCY7roM5ebSowrbiMemWiffhuY5IXSrnJTm
	In4y7GBGIWGwYP4q5/q4FSqOgzphNMQTkOf7hDFmBP+EXhABFnDqY+o1Ys3BnRUMftzA
	k9xSg1JjTa2TPs7KrOPxN3KExA9HquyH+hmDwqJmtSC7yJAPDdeclqinWFOLWyd+WHYu
	fC/E6VttzorGHhVXfj+2rWPxoahCUEEvaxDE3uyV+L7GF09XNHiofB5iDnbWw6rbds6Y
	6Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9HK1uGp4QNWG6xYykWSTB/022BO+CGfiLue16A2x8gk=;
	b=lR5DqW6NA0doyQztEHPrC+GYxq6AdBXu+nCkr6tXlz6sNsFftqCxB7pjy8Jerz2wLO
	7cZUeCMZrKlr6duF407SRYpKEw55zM+OMSszrnCkW3TTpmgnz6jO3THwe+8TpgbpQ7f0
	R0Kc4z3f8dFDolGlRIotlAtVVogW0xzXHF0W0J25VvmfkGwJ3UXxFB3NdsMQwS3g8QqN
	LSQI9ywfMmq3GQ0RQS1AoIMcT4LJkk8oC7yRNwiXnAa+4wSSkB16temPoBOXpVvsuEAx
	XOIGDf54h+Gk0/R+eHaI1xfS2bBGgCaujjCWO0JEH8KNYMSTo8gynnosIIkeWjfPk578
	0gSg==
X-Gm-Message-State: APjAAAVC/Uuv//bMoKYgrwA+ceEsUrxkzXP7LCAPkPh/mviItTJvku2Y
	DiUZOrfRldffCIXmM51BdM0FZw/iHiHFE3StVeVYTD9/
X-Google-Smtp-Source: APXvYqxE00qD2sgD29kA6F0v8zbtnM/RxnwWM3vxPRAtH5PQkY8kUYn/NloNzYSaoSxiDkEAJaJIutK27CIy7TY4YHo=
X-Received: by 2002:a19:7914:: with SMTP id u20mr11844309lfc.41.1553483738218; 
	Sun, 24 Mar 2019 20:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <1553283628-22488-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
In-Reply-To: <1553283628-22488-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 24 Mar 2019 23:15:27 -0400
Message-ID: <CADkTA4N_4AqV74FeBPpGYNZz6+qFrqNJ-omgnoeAK3DSPDV52g@mail.gmail.com>
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] sysvinit-inittab_xen.inc: fix hypervisor console
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
X-List-Received-Date: Mon, 25 Mar 2019 03:15:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 23, 2019 at 12:12 PM Manjukumar Matha
<manjukumar.harthikote-matha@xilinx.com> wrote:
>
> This commit switches over to using existing SERIAL_CONSOLES mechanism
> for hvc0 inittab entry generation.  This then results in
> /bin/start_getty wrapper being used, which avoids the getty failure seen
> when running a xen capable rootfs natively on linux.

merged.

Bruce

>
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> ---
>  recipes-core/sysvinit/sysvinit-inittab_xen.inc | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/recipes-core/sysvinit/sysvinit-inittab_xen.inc b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> index 9d0589c..4d56806 100644
> --- a/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> +++ b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> @@ -1,4 +1 @@
> -do_install_append() {
> -                echo "" >> ${D}${sysconfdir}/inittab
> -                echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
> -}
> +SERIAL_CONSOLES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' 115200;hvc0', '', d)}"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

