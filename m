Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DDE2AE00DC3; Mon, 29 Jan 2018 07:16:10 -0800 (PST)
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
	*      [209.85.215.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67E15E00D17
	for <meta-virtualization@yoctoproject.org>;
	Mon, 29 Jan 2018 07:16:09 -0800 (PST)
Received: by mail-lf0-f67.google.com with SMTP id f136so10485031lff.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 29 Jan 2018 07:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xf8qxfqSo/kMxKbzviNN/E7LxBWc17ZGF97T08hcwpU=;
	b=P61bg1q3ofs1Hu587cvHhI9oh5L4hXLw4QIHXwQGaXyh7i4n+G+7OGM8mgK6hQHG4A
	074jzvchzy1pJabE8JMwmMf0+aYczlz+pHcdr1uZ0Ki4r9Qmwn/hZSWTB9fcSMAKFJoY
	H2a3LMSjQjSaVydmyLtOMHbhkCBXTncxzmvUEs3mSULIm6wVCIxJiZVMq5oPqFLe20fI
	djfeRhXV7gS9fhBWJ31zhMuvMOzLdGRg4QvEXVDdjVdgrgyUP8Ms8uetk9TGP0gNigmn
	l3t4aB0LjN8JwxNNHw2EFFNWCF2atCCW+r35vFcH8+bLIIppDJplhYcXLQ7X2H1zOplK
	L5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xf8qxfqSo/kMxKbzviNN/E7LxBWc17ZGF97T08hcwpU=;
	b=FpnaFKs4s0piVOaHIcAjH3buoFb+Vp6AzDVhkztt0SoXlC3LA775kAAQ36WI20GFWI
	uuYXQCcyX7+Ml0xCHEpnc+XOxWQCNiGjmoWWqabASsBNXw3PJJQTHFNZkrBzEl7QIGA/
	a+2NNY22ifYi6EgwCXij+K6tJWR3170+C8M1n81Krh5hD46ZVsZN6zGXsGRKetx/YfI5
	Y6TzBbTNQTQfvEcJpHw8vOorNHI1ZBkZKR1ybvTbsiHtX7vKlyMdQQ5rZezQcoCdhDRF
	6YLh0mA4cbiE1FD/9s0UU8mjPHdkNElxA5Xi9zcbydq1HIcrbLC7XKHi6jfcDnJdaqsS
	Ndmw==
X-Gm-Message-State: AKwxytf+vFiz/3/bjOSH+T+mwwLdg6T+auRVlsTFakTKhmhMqDxi4UUD
	2lcRGTDUavja31SuHBm025MBGg2hlwcCyr7N6v70Xg==
X-Google-Smtp-Source: AH8x226SpnwCBsqVwZiK2QydeuL6CI/UcW+E3cZ5fGPIU5bSYoPlHHjmaDD5sJ3vpDuB+l25K4B36EeIVEgTcT3q5rc=
X-Received: by 10.25.213.19 with SMTP id m19mr13394359lfg.4.1517238967986;
	Mon, 29 Jan 2018 07:16:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.18.151 with HTTP; Mon, 29 Jan 2018 07:16:07 -0800 (PST)
In-Reply-To: <1516897717-23079-1-git-send-email-mark.asselstine@windriver.com>
References: <1516897717-23079-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Jan 2018 10:16:07 -0500
Message-ID: <CADkTA4OS6Y6O_=Su=R=-SHWpN1hxJmp4C-wH+mo8DudsDhkviw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] openvswitch: uprev to 2.7.3 (latest 2.7.x stable)
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
X-List-Received-Date: Mon, 29 Jan 2018 15:16:10 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Jan 25, 2018 at 11:28 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Eventually we will have to move to OVS 2.8.x or 2.9.x to support the
> version of DPDK in meta-dpdk but before we make a version jump(s)
> let's uprev to the latest 2.7.x stable release.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> As with other OVS uprevs I have completed in the past I tested out our
> normal usecases with OverC and basic manual configurations.
> Additionally I ran the ptests and got the usual pass/fail rate (if
> anything these numbers are some of the best I have seen).
>   ERROR: 2332 tests were run,
>   21 failed unexpectedly.
>   3 tests were skipped.
>
> Mark
>
>  ...nvswitch-add-ptest-b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1.patch} | 0
>  recipes-networking/openvswitch/openvswitch_git.bb                     | 4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-networking/openvswitch/openvswitch-git/{openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch => openvswitch-add-ptest-b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1.patch} (100%)
>
> diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1.patch
> similarity index 100%
> rename from recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch
> rename to recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1.patch
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index b4aab35..7898067 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -12,11 +12,11 @@ RDEPENDS_${PN}-ptest += "\
>         "
>
>  S = "${WORKDIR}/git"
> -PV = "2.7.1+${SRCREV}"
> +PV = "2.7.3+${SRCREV}"
>
>  FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>
> -SRCREV = "b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc"
> +SRCREV = "b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1"
>  SRC_URI = "file://openvswitch-switch \
>             file://openvswitch-switch-setup \
>             file://openvswitch-testcontroller \
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

