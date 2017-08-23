Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FF6EE00CAE; Wed, 23 Aug 2017 13:18:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.196 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92131E00B8D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 13:18:12 -0700 (PDT)
Received: by mail-yw0-f196.google.com with SMTP id u133so386232ywc.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 13:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/YBgdLo/8HTpxKYc7A/ps1z3eYt99BF+Epw1C0qfLek=;
	b=Xi6oSLXXDc8YXZQhKhrtP2SEorVtTHvEAOVfHy8bv1rd9ozAJhnAam2L8bBUzUApsd
	LGswnsY5yumYxj++El/ir6waDqpwU2VWn1mGprCilzLHL88A+9c8cNE9gSC+mv4l1z3y
	lEmI1cX8zqGX5kv8En6DAdhVlfnWbWr4IXiJhhWfft9NfI7d2xwhpNrjahEGckkmQx31
	+/rYxs9fhsXq5p78C2BdIcrBHeSO19o/MaPwBqaHj025Xf2Yp9GIogPjpbXflBaOerkb
	v27R+yLWqwBhqGVIDvLuIqxyeLwv+idBTxuoM68VtmQtIMHNb16PQuUVlDLqnrsM2JWx
	1UQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/YBgdLo/8HTpxKYc7A/ps1z3eYt99BF+Epw1C0qfLek=;
	b=ExFgA+7w4yNCWDY25WmnJaySnz0qfKvZ0CjPa5Mq+B7tNiFM5XQ2QZzbEhmw8LQd9J
	ie7ookJeQbBGRpI/D+9WKnLYEiEjjyvvtgA9RIbWFcGJ5ijPTT96hHyxHaUR9oT1R5PV
	v/SkeaxAnNRPbjbdXvWJv2PSuVBV1zxUmM+k1MrV57cqoLb+Ivk7GKLnueQYGTiHnWVw
	WnAFisGxDVUsEli+BZYNuD5J72shFRuYDORV2+6+CGwc7i0Jis9KLalUZ75NGU9bUkdz
	Prci8YkXtQmT0fjPL9Bjmg3xaLHyx13pa01eW01LPM3+XxBQvYm0dS4CwvQs0k1ry373
	WoIA==
X-Gm-Message-State: AHYfb5idN7lZr5cA8eQDu02DuNHhDbe1v/bm5rZHeRsTRBpSDR0/OsId
	kA2yeEqUBRnepoNVte/V1aOCGItkXw==
X-Received: by 10.13.248.2 with SMTP id i2mr3085178ywf.110.1503519491627; Wed,
	23 Aug 2017 13:18:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.175.4 with HTTP; Wed, 23 Aug 2017 13:18:11 -0700 (PDT)
In-Reply-To: <CADkTA4OOmrktgV+BHS=K2dEKUvJ_scO5mfk1nW5myNeS17VzLw@mail.gmail.com>
References: <1503378503-23353-1-git-send-email-christopher.w.clark@gmail.com>
	<1503378503-23353-2-git-send-email-christopher.w.clark@gmail.com>
	<CADkTA4MGpGfw_-mByH=VyUeg1a6pfMugww4YkSS2PfxJ02e-tQ@mail.gmail.com>
	<CACMJ4GZumvFVR4FkJ9UO1b9SzL+fxwj4kcrGHsgayksOQcMngA@mail.gmail.com>
	<CADkTA4OOmrktgV+BHS=K2dEKUvJ_scO5mfk1nW5myNeS17VzLw@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 23 Aug 2017 13:18:11 -0700
Message-ID: <CACMJ4GYuq01TGd3Py-Twhi4Hs5iWO9S85hsH9aVBU1WyuRap4w@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH 1/4] vgabios : extract biossums tool and build it separately, native
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
X-List-Received-Date: Wed, 23 Aug 2017 20:18:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 5:54 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Wed, Aug 23, 2017 at 2:43 AM, Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
>>
>> On Tue, Aug 22, 2017 at 7:42 PM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>> > On Tue, Aug 22, 2017 at 1:08 AM, <christopher.w.clark@gmail.com> wrote:
>> >> From: Christopher Clark <christopher.clark6@baesystems.com>
>> >>
>> >> The biossums tool is used to generate the vgabios build product.
>> >>
>> >> This patch:
>> >> * adds a separate recipe "biossums" for the tool
>> >> * makes the vgabios recipe depend upon biossums-native
>> >> * makes the vgabios recipe use the native binary rather than a locally
>> >> built one

>> >> +
>> >> +do_compile() {
>> >> +    oe_runmake clean
>> >
>> >
>> > What actually happens if the clean isn't run before each compile ?
>>
>> It's a good question. Here's where I see different behaviour with and
>> without that clean:
>>
>> bitbake -c cleansstate vgabios biossums-native
>> bitbake vgabios
>>
>> With the clean present, building vgabios will trigger biossums-native
>> to be built to satisfy the dependency, and vgabios's compile will
>> succeed. Without the clean present, biossums-native does get its build
>> triggered, but the vgabios build fails with:
>>
>> "make: execvp: biossums: Accessing a corrupted shared library"
>
>
>
> Interesting. So it sounds like whatever is installed from biossums-native in
> a
> previous build is checked for .. something ... and declared invalid on a
> subsequent run.
>
> .. but since the clean is before the make of biosums-native, I'm at a loss
> to
> understand why on a later build of vgabios it makes a difference. Is it some
> sort of host vs target issue ?

I think yes, something like that is going on, but I don't have a
precise answer yet.

> When that error happens, and you look in the native sysroot, what does
> the .so look like ? What does file say about it ?

It's probably helpful to know that I do not have the 32-bit
compatibility libraries installed on this debian build VM, which I
think is ensuring that things that should break are breaking.

Without the clean:

user@build-vm:tmp$ file
sysroots-components/x86_64/biossums-native/usr/bin/biossums
sysroots-components/x86_64/biossums-native/usr/bin/biossums: ELF
32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically
linked, interpreter
/mnt/build/master/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2,
for GNU/Linux 2.6.4, stripped

user@build-vm:tmp$ ldd
sysroots-components/x86_64/biossums-native/usr/bin/biossums
    not a dynamic executable


With the clean:

user@build-vm:tmp$ file
sysroots-components/x86_64/biossums-native/usr/bin/biossums
sysroots-components/x86_64/biossums-native/usr/bin/biossums: ELF
64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked,
interpreter /mnt/build/master/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2,
for GNU/Linux 2.6.32,
BuildID[sha1]=e47d34032f342f20532a91d95208534e080cdc73, stripped

user@build-vm:tmp$ ldd
sysroots-components/x86_64/biossums-native/usr/bin/biossums
    linux-vdso.so.1 (0x00007fff383ed000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f673ecd5000)
    /mnt/build/master/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
=> /lib64/ld-linux-x86-64.so.2 (0x00005588ab4c3000)


Just for completeness, I also get these same results directing bitbake
to build biossums-native directly, rather than inferring it from
vgabios's dependencies, with this:
bitbake -c cleansstate vgabios biossums-native && bitbake biossums-native

