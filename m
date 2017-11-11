Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22F29E00CFF; Fri, 10 Nov 2017 19:48:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAB12E00CEF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Nov 2017 19:48:43 -0800 (PST)
Received: by mail-qk0-f172.google.com with SMTP id j202so3315379qke.10
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Nov 2017 19:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fc51HlQrE5qQuHS8pB01sPCl2QJxvI+GDhSZvKTHWUE=;
	b=o4/W1Dv/4amH91QIUOahHdx3J+J7FkuEtpnOrljGL7AB1ET9W2/7y41MFafAOBNlMi
	2zaxAEDr3gBqyixig6lh4Bh+bw0FSMh8i/h5rYoVmzZn0Hm6u6k8P5VJmiOxfrmS6um+
	M2VdEO0sufSoGXV7x5aGj56VyggqreBANRSb/UeFZjI3JyjjYTLOg6CvoFVcQlGyIbw1
	B35JzGgyl/wXlivi52oO9bV1sKiTmUBb37G5KtgtBBWfA2eZ4LQFG05BiF6LI4u+7yD9
	GS6wTsTgraL//XNZxt2ujUw9/kqsEDucnS8Zr+udGFQ3eXUhk+QYBmVrDf1upuYg+1j+
	zcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fc51HlQrE5qQuHS8pB01sPCl2QJxvI+GDhSZvKTHWUE=;
	b=MH0/huxVOlL8RaDoE9t6BoLZisIMPoQ7T7v6feAQwaauxZ5zfpqkDJfOKbnrtSORvE
	EB2dvjJA5pbV2I0sxvQvnBQjim29l73smXaXS36yV3meejVhAcf4lIfcVfLcgiYOXSaX
	woDa53O8h7ZQzrrbQcbHA21jkO/a4FcJpTJByIBC7Vf6EpkZrfxiYgQfQ21uiNk2PmOv
	F4jaWp3HlRSyWOVV4HdMLHeGzxH+HrtRnDEAcS206Z/X4Ug0fJkUhLfNEY1woQbAgG3G
	Q4XBhFUzIM3e4gJL6lZVzthlsbcM5h3na1XKI3UWHhtRVGCh+eYORzQi70YFmgQ+N4fE
	RLUA==
X-Gm-Message-State: AJaThX6PEEPDmveJrfiUaW05o8zUELLPrriy3QoU1wBwRnTkYvY8zCP6
	T7UP/WaK5jR/TKGfmLauJOpQyKlAtQt8emStU5I=
X-Google-Smtp-Source: AGs4zMasbtJuuiCLXhK1GgzhDVa030naaZf99P7FTVAEVZ6lK6KyHPlwyaOXLwuXV5aiUrQBfakcjqr/oRSD+aLnYc0=
X-Received: by 10.55.121.2 with SMTP id u2mr3772020qkc.19.1510372122835; Fri,
	10 Nov 2017 19:48:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Fri, 10 Nov 2017 19:48:42 -0800 (PST)
In-Reply-To: <CAGQ4JX0waag2sfdSmPSvFe609-V6s2HTEYgrG=Qz9OSio1SWMA@mail.gmail.com>
References: <CAGQ4JX0waag2sfdSmPSvFe609-V6s2HTEYgrG=Qz9OSio1SWMA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 Nov 2017 22:48:42 -0500
Message-ID: <CADkTA4NXiDWTsmQHO+WtO4qxGCe4st4368=O54ApDF4J-QgTXQ@mail.gmail.com>
To: Ravi chandra reddy <vlsireddy@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Issue in irqbalance Code AARCH64-ARM-A53
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
X-List-Received-Date: Sat, 11 Nov 2017 03:48:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 10, 2017 at 9:43 PM, Ravi chandra reddy <vlsireddy@gmail.com> wrote:
> Hi All,
>
> 1. based on this link
>
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-virtualization/
>
> 2. i see the irqbalance is of version 1.1.0 [Dec 4, 2015]
>
> 3. Building meta-virtualization library for irqbalance failed for AARHC64.
>
> 4. The Issue is simple bug [i fixed in my downloaded, untar'ed code],looks
> someone also fixed the code and new version 1.2.0 does include this fix.
>
> [https://github.com/Irqbalance/irqbalance/commit/1dccd034a90b2f0221423632de65cbf84d05ebfb#diff-69b8dbcfbbf11746aa38c26a4604e551]
>
> 5. Is there any reason why irqbalance is NOT updated to 1.2.0 in
> meta-virtualization.

Nope, no reason.

Send a patch to upgrade it, and it'll be 1.2.0 :D

Bruce

>
> 6. According to github, version 1.2.0 has Aarch64 support
> [https://github.com/Irqbalance/irqbalance/releases]
>
> Thanks
> RC Reddy
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

