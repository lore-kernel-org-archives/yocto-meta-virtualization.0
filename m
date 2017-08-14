Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1322E00CFE; Mon, 14 Aug 2017 12:56:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 191FAE00B8D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Aug 2017 12:56:39 -0700 (PDT)
Received: by mail-yw0-f193.google.com with SMTP id u207so6848863ywc.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Aug 2017 12:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PMFtCiNkIk+ARYVBV58g8G51rcLwreSy6+UYEh8wvew=;
	b=kzX8+7F6pkezstFOMGco2GUN4nkw4YjziWWYNunZGasnMtafVl2IIWNN8LsNXaRzfO
	9f2EdbZoqbjICxGD2hhOqFiE1jl+yg4aa8yCbSEs1Si5MMkTrbMojAZkXYtKfXgcprva
	7QDWxcr/mIFH/sgNsqRv+FfHvgt+wWc/aG4hp714j7MO6W7y1sC61tJxDU+kue55kZGY
	5Oq9LFVP2ukc7pjE1YqBfR+Pj6pMX7Br/VPDk/UaJljieNqXuqWDEmD8Bgx/h6WGF+7J
	g2Jpy0DFiDvh2bPQiSruiY2DZbVXdMN/IJnh1GTW9Z6nd9qtd/o5p064BVdRiO6LkRHW
	j/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PMFtCiNkIk+ARYVBV58g8G51rcLwreSy6+UYEh8wvew=;
	b=VrSKEk6M+vL15L7nYYD7PUqhvmNWhRnOyE3cu+UhHFsNCWbAE7i7l95CHkyqw2m9K/
	edZpgcAahN6av0KeEK502MUYyRRsF6d9/FpjEYfFhH0HhAVEpJhsMaKQlszaOnAVEH2+
	l9lbmudck2mGSt7cnbRUKx+KqBZzOnrWfKAJKxBiP/VucaQvW6Tqi8yt57EMnKnDH1vA
	6HOKgqwl21SYS1KnCruktKniOzXJlfO5KNfy49l/rCkDCUP6qUZ2ayUsejk28pllRJuQ
	noioN1Q3ZhASmMQKaVm+2J/hkwgbC2Alep6+6AwTxocbKhH7RILLs5qZRrDigLhOsYXC
	D2XQ==
X-Gm-Message-State: AHYfb5jq0Q76h6NFHgr2+X0SveoHhrczJI7AbMIEm7MhGbw26Y0kWRqV
	zByF3lOmuGIxNZXXkShRGFOB09hCGw==
X-Received: by 10.129.84.139 with SMTP id i133mr20519513ywb.273.1502740599041; 
	Mon, 14 Aug 2017 12:56:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.188.68 with HTTP; Mon, 14 Aug 2017 12:56:38 -0700 (PDT)
In-Reply-To: <CADkTA4MAETxbcU7LEjD66qPY2o0qW1X=kp4WtRVF3kTmUjh=rA@mail.gmail.com>
References: <CACMJ4GaS4wgNiCdvPMWfSqCJoj5hWj1nm441WmfMDp7huFhtLQ@mail.gmail.com>
	<CADkTA4MAETxbcU7LEjD66qPY2o0qW1X=kp4WtRVF3kTmUjh=rA@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 14 Aug 2017 12:56:38 -0700
Message-ID: <CACMJ4GaKKVNOVv1+syMPS1KXwUCyeexeEOLbfhGM0v1LMVPbig@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, cardoe@gentoo.org
Subject: Re: [PATCH] xen: remove STAGING_DIR_HOST from runtime path for bios.bin
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
X-List-Received-Date: Mon, 14 Aug 2017 19:56:40 -0000
Content-Type: text/plain; charset="UTF-8"

    xen: remove STAGING_DIR_HOST from the runtime search path for bios.bin

    This configuration option sets a run-time search path rather
    than the location of a build-time dependency.

    Tested with Xen 4.9 on OpenXT.

    Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index a28d474..6a0f226 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -22,7 +22,7 @@ FLASK_POLICY_FILE ?= "xenpolicy-${PV}"
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] =
"--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
-PACKAGECONFIG[hvm] =
"--with-system-seabios="${STAGING_DIR_HOST}/usr/share/firmware/bios.bin",--disable-seabios,seabios
ipxe vgabios,"
+PACKAGECONFIG[hvm] =
"--with-system-seabios="/usr/share/firmware/bios.bin",--disable-seabios,seabios
ipxe vgabios,"

 DEPENDS = " \
     bison-native \

On Mon, Aug 14, 2017 at 9:05 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> This patch came through corrupted:
>
> [/home/bruc...ualization]> git am -s b.mbox
> Applying: xen: remove STAGING_DIR_HOST from runtime path for bios.bin
> fatal: corrupt patch at line 12
> Patch failed at 0001 xen: remove STAGING_DIR_HOST from runtime path for
> bios.bin
>
> Bruce
>
> On Wed, Aug 9, 2017 at 9:06 PM, Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
>>
>> Bug fix: this configuration option sets a run-time search path rather
>> than the location of a build-time dependency.
>>
>> Tested with Xen 4.9 on OpenXT.
>>
>> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
>> ---
>>  recipes-extended/xen/xen.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>> index 677ab69..274d0df 100644
>> --- a/recipes-extended/xen/xen.inc
>> +++ b/recipes-extended/xen/xen.inc
>> @@ -22,7 +22,7 @@ FLASK_POLICY_FILE ?= "xenpolicy-${PV}"
>>  PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
>>  PACKAGECONFIG[xsm] =
>> "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
>>  PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
>> -PACKAGECONFIG[hvm] =
>>
>> "--with-system-seabios="${STAGING_DIR_HOST}/usr/share/firmware/bios.bin",--disable-seabios,seabios
>> ipxe vgabios,"
>> +PACKAGECONFIG[hvm] =
>>
>> "--with-system-seabios="/usr/share/firmware/bios.bin",--disable-seabios,seabios
>> ipxe vgabios,"
>>
>>  DEPENDS = " \
>>      bison-native \
>> --
>> 2.7.4
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"

