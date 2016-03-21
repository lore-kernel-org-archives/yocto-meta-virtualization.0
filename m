Return-Path: <psiva87@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F29AE00911; Mon, 21 Mar 2016 06:06:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (psiva87[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.46 listed in list.dnswl.org]
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4689EE007C2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Mar 2016 06:06:10 -0700 (PDT)
Received: by mail-lf0-f46.google.com with SMTP id e196so31824024lfg.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Mar 2016 06:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=ihgSii5KCWyUuNXZhNrYIi5PLXzAsM1LVbP9V4Ohjxw=;
	b=vxdopc06a1/ajBIqjBjNbWuFap7bd4ajUatjxbCDIHe+ayUZo0WCojb/piOuw02wKQ
	PuMcJaElkT6i/E0smTgn79nCI6U64uDaEKR8PX34Bo3hOrsMvLfDKp+YwN9fdvDr4K4V
	RnJydYLMsO5k99wzkEkmQ/AK2DJ825UbpN+BJDDRkgdviS+8EnC8w9x4m+oDknneSWrg
	EtmnEr1epwLW1HtGfPOVd8jSS4MiBC+2dKtuRjuvYNCD6NGnchrXBzYb+LQpeVsmi5iH
	AoWJTVQS67A0fGLcsZTTANtNtZuzGQsM1ofDu0UB9R62w0zYQpm2Ugu7c0MBJiY1+QRR
	8J7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=ihgSii5KCWyUuNXZhNrYIi5PLXzAsM1LVbP9V4Ohjxw=;
	b=DNVMtfLvJVSl+tim4gxnZFUSQ8ngXIBat4lbnQyWr70ohvLerzMi1omX7/1B6kUhi/
	D8kcRp8jFOfWdfaOMnfnpjAd3VqZThschhemGEorpUm8pWoybQrfZDfBq4QHzSqs4wxA
	mnju0zhypsCVWYh/iOa2rv9OwHQVq5RkTvY5WXClk7o71mZXYpHjDBonfuh4uwZB+D2x
	P7tckKrFgzgj5cC5rUAy2c3nCFjsdXv38hb740XD72BtbgrCGuE+KUlO0sEQlp0f6DvR
	nju6s8bOtH2uQ7xPpeaKjVBPfCrF0+OikqBfJ0H9EbNssZA1twBWY/5+RNy+y4MWn/Oz
	KZUw==
X-Gm-Message-State: AD7BkJIvhTZMBI/uTtd8BO3E4vVVnGAnWZco7b3E1pKlK7mDScQHWEBLColr29y0DJqlznuczucqVYlqu+gUQQ==
MIME-Version: 1.0
X-Received: by 10.25.138.7 with SMTP id m7mr11382535lfd.109.1458565568717;
	Mon, 21 Mar 2016 06:06:08 -0700 (PDT)
Received: by 10.112.199.10 with HTTP; Mon, 21 Mar 2016 06:06:08 -0700 (PDT)
In-Reply-To: <749328d420b14773bc1a7a54138271a8@FE-MBX1005.de.bosch.com>
References: <749328d420b14773bc1a7a54138271a8@FE-MBX1005.de.bosch.com>
Date: Mon, 21 Mar 2016 18:36:08 +0530
Message-ID: <CAOorjZQMsZbrsiqbJJJKqi0tp7cyiT2iFOg-gL218HkKbVPrQQ@mail.gmail.com>
From: "SIVA SUBRAMANIAN.P" <psiva87@gmail.com>
To: "Biyani Arun (CM/ESC-NA)" <Arun.Biyani@us.bosch.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Nothing PROVIDES 'libxl'
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
X-List-Received-Date: Mon, 21 Mar 2016 13:06:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

As far as I know, meta-virtualization doesn't provide this. Do you
have any bbappend for libvirt.bb which depends on libxl?

On Mon, Mar 21, 2016 at 4:48 PM, Biyani Arun (CM/ESC-NA)
<Arun.Biyani@us.bosch.com> wrote:
> I am trying to include Xen in my Yocto build. I have included the
> meta-virtualization layer. However, I am
> getting this error:
>
> ERROR: Nothing PROVIDES 'libxl' =E2=80=A6.
> Close matches:
>   libxslt
>   libxml2
>   libxv
> NOTE: Runtime target 'libvirt' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['libvirt', 'libxl']
>
> What am I missing? Is libxl in meta-virtualization or somewhere else?
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

