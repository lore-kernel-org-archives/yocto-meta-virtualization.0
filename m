Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7DF1FE00B3F; Wed, 26 Aug 2015 15:18:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.223.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC8D3E009BC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Aug 2015 15:18:10 -0700 (PDT)
Received: by iodt126 with SMTP id t126so36814641iod.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Aug 2015 15:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=o6h7CO1upXykfhTxtVfkpZqOclCPgOEAhflcOT5wyZ8=;
	b=A9Dbv4YUQgigilmF3evHI9bMEEZDQ7c8URlRU3Y2VqP4ojvAQSKsR/lYtgbbu80+cx
	WZy9ALrCKgXIp3XmGNIt3FwElOun5KJU+STHI5U+X+EpvrsB3l89CkV0Q3tm56Pwb9+X
	2JXBVOTu/ATMgIL6iYpA53xXolM1fyAkneP+eUrKXp2vlm6uvEqtYt7186AGMkIAASAT
	6XNpvOSg2DlcmcLMHKPMdfXGcbXJtF1i2yI4HYC3O+WscSzoMu9/GcppaAk2KgR+jGHk
	ChNIRZcY0o+obZfeRPO5oXiDNM/OHU2FgQwmAHA0HeJ/4X78mvs6NfkKmIupxp/3xiCe
	37eA==
X-Gm-Message-State: ALoCoQnPh46w80nBYEyz4yMUn0wH13qF780qUL5dPUTY2BofgYhFXmjqIbUUYelbxrUV8Q7CBkqT
MIME-Version: 1.0
X-Received: by 10.107.130.28 with SMTP id e28mr7998663iod.77.1440627489759;
	Wed, 26 Aug 2015 15:18:09 -0700 (PDT)
Received: by 10.107.182.213 with HTTP; Wed, 26 Aug 2015 15:18:09 -0700 (PDT)
In-Reply-To: <CA+aJhH1V+_mFMdoqStYssgFzG5PYR6XcYx7gKyeo9xSxXjg_ww@mail.gmail.com>
References: <1440448008-9189-1-git-send-email-cardoe@cardoe.com>
	<CA+aJhH1V+_mFMdoqStYssgFzG5PYR6XcYx7gKyeo9xSxXjg_ww@mail.gmail.com>
Date: Wed, 26 Aug 2015 17:18:09 -0500
Message-ID: <CAFWqQMTC4C4WR2-FE6MeFA067EbEcW1LoOyMh2aHONaq6yUXdg@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/4] xen: drop patch that upstream says is wrong
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
X-List-Received-Date: Wed, 26 Aug 2015 22:18:16 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 25, 2015 at 1:44 AM, Nathan Rossi <nathan@nathanrossi.com> wrote:
> On Tue, Aug 25, 2015 at 6:26 AM, Doug Goldstein <cardoe@cardoe.com> wrote:
>> Per upstream its not correct to always force -mfpmath=387 to work around
>> the -mno-sse flags. Instead strip out -mfpmath=sse that Yocto injects
>> for certain BSPs.
>> ---
>>  ...xen-x86-Fix-up-rules-when-forcing-mno-sse.patch | 28 ----------------------
>>  recipes-extended/xen/xen.inc                       |  5 ++++
>>  recipes-extended/xen/xen_4.5.0.bb                  |  1 -
>>  3 files changed, 5 insertions(+), 29 deletions(-)
>>  delete mode 100644 recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch
>>
>> diff --git a/recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch b/recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch
>> deleted file mode 100644
>> index 4c3e297..0000000
>> --- a/recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -From: Nathan Rossi <nathan.rossi@xilinx.com>
>> -Subject: [PATCH] xen/x86: Fix up rules when forcing -mno-sse
>> -
>> -* When forcing -mno-sse specify -mfpmath=387 to avoid the fallback
>> -  warning
>> -
>> -Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
>> -Upstream-Status: Not-Submitted
>> ----
>> - xen/arch/x86/Rules.mk | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/xen/arch/x86/Rules.mk b/xen/arch/x86/Rules.mk
>> -index 6775cb5..03848f7 100644
>> ---- a/xen/arch/x86/Rules.mk
>> -+++ b/xen/arch/x86/Rules.mk
>> -@@ -42,7 +42,7 @@ x86 := y
>> - x86_32 := n
>> - x86_64 := y
>> -
>> --CFLAGS += -mno-red-zone -mno-sse -fpic
>> -+CFLAGS += -mno-red-zone -mno-sse -fpic -mfpmath=387
>> - CFLAGS += -fno-asynchronous-unwind-tables
>> - # -fvisibility=hidden reduces -fpic cost, if it's available
>> - ifneq ($(call cc-option,$(CC),-fvisibility=hidden,n),n)
>> ---
>> -2.1.1
>> -
>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>> index 432bf4d..c7a2347 100644
>> --- a/recipes-extended/xen/xen.inc
>> +++ b/recipes-extended/xen/xen.inc
>> @@ -12,6 +12,11 @@ inherit autotools-brokensep gettext setuptools update-rc.d systemd
>>
>>  require xen-arch.inc
>>
>> +# Xen uses hardcodes the use of -mno-sse which conflicts -mfpmath=sse
>> +# The issue arises from certain Yocto machine BSPs injecting -mfpmath=sse
>> +# into the package's CFLAGS so we need to strip that
>> +TUNE_CCARGS := "${@oe_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}"
>
> Just curious, filtering out that flag will also affect the building of
> for example the target user-space tools no? is that problematic or do
> other SSE related flags (for those BSPs) cause the use of this fpmath
> setting regardless?
>
> Regards,
> Nathan

Yes you are correct. The existing patch was more targeted. However
while the tools are built a lot of them aren't used.
meta-virtualization pulls in its own QEMU and firmware blobs. The
default in this case is -mfpmath=sse,387 so it won't really affect
anything. But you are probably right this patch should be dropped and
the existing path should be used. I'll approach this from the Xen side
again.

--
Doug


>
>> +
>>  PACKAGECONFIG ??= " \
>>      sdl \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>> diff --git a/recipes-extended/xen/xen_4.5.0.bb b/recipes-extended/xen/xen_4.5.0.bb
>> index 6c17b90..a5f03f3 100644
>> --- a/recipes-extended/xen/xen_4.5.0.bb
>> +++ b/recipes-extended/xen/xen_4.5.0.bb
>> @@ -2,7 +2,6 @@ require xen.inc
>>
>>  SRC_URI = " \
>>      http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
>> -    file://xen-x86-Fix-up-rules-when-forcing-mno-sse.patch \
>>      "
>>
>>  SRC_URI[md5sum] = "9bac43d2419d05a647064d9253bb03fa"
>> --
>> 2.1.4
>>



-- 
Doug Goldstein

