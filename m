Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 056B1E0076F; Tue, 17 Mar 2015 06:43:47 -0700 (PDT)
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
	*      [209.85.215.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D0AEE00746
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Mar 2015 06:43:44 -0700 (PDT)
Received: by labjg1 with SMTP id jg1so8867135lab.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Mar 2015 06:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=neFWLhoP7dh3r8nchrg8Pmzr6SgfBppmcNMeHmMrNqU=;
	b=CdvnaPVBq2LL/DyVBXCuEiNpMlBqbtsyNMORp13eaOOwnL/p6tgSNauM3rdS8WFY+z
	NO41+6LZpOnCx2IEif6t/2kiEuC6/CmYbit+afN4gopvEbJmBvafQM8xmespTQyn/Tig
	73ojXcyyaGuqZUxzRU7cvKKpsH5CRUgij+FkaLmgL0FtWxpBfZ8e0/YhJn5qSQbL0mOY
	sciF7pm4Yjdm4V2RITQBIWtlbz5K9eHBC7OVBi2iLVP1kq30Bqv9B2mOiTtNMAhQTOZC
	cJ7k3u0pDmdERCOucleJNdPvTMrevdFODu0IHTott6PpIskUcYQi+m+m+qLuZV/g7yh4
	xBuA==
MIME-Version: 1.0
X-Received: by 10.152.170.164 with SMTP id an4mr45533257lac.9.1426599823568;
	Tue, 17 Mar 2015 06:43:43 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Tue, 17 Mar 2015 06:43:43 -0700 (PDT)
In-Reply-To: <AF233D1473C1364ABD51D28909A1B1B73278D92B@PGSMSX105.gar.corp.intel.com>
References: <1426570151-25669-1-git-send-email-boon.leong.ong@intel.com>
	<AF233D1473C1364ABD51D28909A1B1B73278D92B@PGSMSX105.gar.corp.intel.com>
Date: Tue, 17 Mar 2015 09:43:43 -0400
Message-ID: <CADkTA4NoZSq16ExijdqFEu27LOrUSwZetH_R7kAcfr35u5otsw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Ong, Boon Leong" <boon.leong.ong@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] dev86: Adjusted the SRC_URI of the source code.
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
X-List-Received-Date: Tue, 17 Mar 2015 13:43:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 17, 2015 at 1:43 AM, Ong, Boon Leong
<boon.leong.ong@intel.com> wrote:
> Ah... I miss "dizzy" in the subject. Sorry, Bruce.
> Appreciate if you can also apply this patch on dizzy branch too. Thanks

Aha. I've applied it to dizzy.

Bruce

>
>>-----Original Message-----
>>From: meta-virtualization-bounces@yoctoproject.org [mailto:meta-
>>virtualization-bounces@yoctoproject.org] On Behalf Of Ong Boon Leong
>>Sent: Tuesday, March 17, 2015 1:29 PM
>>To: meta-virtualization@yoctoproject.org
>>Subject: [meta-virtualization] [PATCH] dev86: Adjusted the SRC_URI of the
>>source code.
>>
>>From: j105rob <j105.rob@gmail.com>
>>
>>The SRC_URI of the source code was returning a 404. After locating the correct
>>URI for this version of the source code, updated the SRC_URI & hashes.
>>
>>Signed-off-by: j105rob <j105.rob@gmail.com>
>>Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com> (cherry picked
>>from commit 2892c53779f4cf2e58e3c60302b7e9ef792f938e)
>>
>>Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
>>---
>> recipes-extended/dev86/dev86_0.16.19.bb |    6 +++---
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>>diff --git a/recipes-extended/dev86/dev86_0.16.19.bb b/recipes-
>>extended/dev86/dev86_0.16.19.bb
>>index 807504e..5e26a75 100644
>>--- a/recipes-extended/dev86/dev86_0.16.19.bb
>>+++ b/recipes-extended/dev86/dev86_0.16.19.bb
>>@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM =
>>"file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>> SECTION = "console/tools"
>> PR="r0"
>>
>>-SRC_URI="http://www.debath.co.uk/dev86/Dev86src-${PV}.tar.gz"
>>+SRC_URI="https://github.com/lkundrak/dev86/archive/v${PV}.zip"
>>
>>-SRC_URI[md5sum] = "442e98e1afa23fe00d40c5a996385942"
>>-SRC_URI[sha256sum] =
>>"33398b87ca85e2b69e4062cf59f2f7354af46da5edcba036c6f97bae17b8d00e"
>>+SRC_URI[md5sum] = "1308759f36f9907e7dae92c46f35c51e"
>>+SRC_URI[sha256sum] =
>>"efd33d456ff87d6d0308608f6a34052b22ea8629913d0597d98c73815ed0f9f0"
>>
>> S = "${WORKDIR}/dev86-${PV}"
>>
>>--
>>1.7.9.5
>>
>>--
>>_______________________________________________
>>meta-virtualization mailing list
>>meta-virtualization@yoctoproject.org
>>https://lists.yoctoproject.org/listinfo/meta-virtualization
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

