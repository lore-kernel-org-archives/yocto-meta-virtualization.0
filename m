Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF86FE00563; Wed, 16 Jul 2014 07:33:10 -0700 (PDT)
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
	*      [209.85.217.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B9AEE00547
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Jul 2014 07:32:55 -0700 (PDT)
Received: by mail-lb0-f178.google.com with SMTP id 10so727227lbg.9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Jul 2014 07:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vMh5WntKrRl7fENTL6kyPG/vy/rVJXGOVZUvGbCPomQ=;
	b=zSM2/lAMEyj5CUApLSdV3vaCxsvc4ADpi0C+jFuVBz3ryddpJZ5MbiAJ/tWZQfO0Y8
	3LKuDfSZnXCMpnmQCK9VLeXS1quEzlXtp5B19zqb1Fww/LlZCDSgdGKbE2fUVEWo1pWn
	VfDMheNLHJgkiYpQC2Gcw7P/Jctxo//bny3lp9JKneP2IANysQuPmQM+SmekRffrirvn
	szp2zHA2nNF2jjTDAFCsbfczYalOySY560Cmi7zmoMB/gpoKZKvUTadyV6njm7uJq76p
	cw800fsDOBx9VBzLBV6HYqIjPja//BxRIJA800oin52W6FV1V2jeieMfwWR0Sg+t4eYK
	44yQ==
MIME-Version: 1.0
X-Received: by 10.152.6.170 with SMTP id c10mr26046674laa.9.1405521174255;
	Wed, 16 Jul 2014 07:32:54 -0700 (PDT)
Received: by 10.112.124.137 with HTTP; Wed, 16 Jul 2014 07:32:54 -0700 (PDT)
In-Reply-To: <20140715162801.GA28780@sestofb10.enea.se>
References: <1404908262-4773-1-git-send-email-maxin.john@enea.com>
	<20140715162801.GA28780@sestofb10.enea.se>
Date: Wed, 16 Jul 2014 10:32:54 -0400
Message-ID: <CADkTA4Nqg74VAEqfBTAnzBRqrMn63yLRJto8Mwuj7UTmmq6A8w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Maxin B. John" <maxin.john@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] kvm-image-minimal: Fix warning
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
X-List-Received-Date: Wed, 16 Jul 2014 14:33:10 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 15, 2014 at 12:28 PM, Maxin B. John <maxin.john@enea.com> wrote:
> Hi,
>
> On Wed, Jul 09, 2014 at 02:17:42PM +0200, Maxin B. John wrote:
>> Fix this warning:
>> WARNING: Function remove_packaging_data_files doesn't exist
>>
>> Signed-off-by: Maxin B. John <maxin.john@enea.com>
>> ---
>>  recipes-extended/images/kvm-image-minimal.bb | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/recipes-extended/images/kvm-image-minimal.bb b/recipes-extended/images/kvm-image-minimal.bb
>> index abc0fee..c96edca 100644
>> --- a/recipes-extended/images/kvm-image-minimal.bb
>> +++ b/recipes-extended/images/kvm-image-minimal.bb
>> @@ -21,5 +21,3 @@ LICENSE = "MIT"
>>  inherit core-image
>>
>>  IMAGE_ROOTFS_SIZE = "8192"
>> -
>> -ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
>> --
>
> Gentle ping.

Sorry about that, holidays rot the mind!

I was poking around with this before I headed out for vacation, and
didn't remember to
return to it.

I wanted to track down the replacement functionality for this, since
we do want to try
and restrict the size of the images for the minimal variants.

Now that the functionality has moved to lib/oe/* and triggers of
package_management
not being in IMAGE_FEATURES, we should be good by default.

Having that extra bit of information in the commit log would be ideal,
since it lets us
remember that the functionality is automatic and preserved.

Did you want to tweak the log ? or should I ?

Bruce

>
>
> Best Regards,
> Maxin
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

