Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 695C4E00A53; Fri, 26 Jun 2015 06:09:36 -0700 (PDT)
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
	*      [209.85.160.169 listed in list.dnswl.org]
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D00DDE00A4D
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Jun 2015 06:09:32 -0700 (PDT)
Received: by ykdt186 with SMTP id t186so57639223ykd.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Jun 2015 06:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2qmGhy+YjtDGH+u6MAmnwZr/nzV5xOUUX2cFd4gJXto=;
	b=E/qm3LLTGbRGFUkF2nYe6kznjsOsXPdpVTO8s2TSUMYOdls8Stum8DxxouZfeYBfbQ
	dAbKt15EdnThV5Uj1SAvJhrpGlefKEr0hZduZgCjnUMfo7am6nM/dj2RF4b4MH1Lkv6e
	eqGHZvLpJ3X4XR8FEWbFxD3TrKQD06T6X3s0yOYI/Tv8AP0nitSvzxt6EvM9K8qwkcOe
	nX/dqluImqGSXSxoSU6GaBa9whDaEJYkjrgY1ej792+wLzaiyq1aMPNd+Pw8C8/F0ZdP
	qXW8dsYna1rsc6EOccC+TMhdEwfaeDJr6DqE5gRMd/njmcH7EGqd7WH9D5Q8Pmvw4XK1
	MuwQ==
MIME-Version: 1.0
X-Received: by 10.170.56.83 with SMTP id 80mr1744222yky.16.1435324171839; Fri,
	26 Jun 2015 06:09:31 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Fri, 26 Jun 2015 06:09:31 -0700 (PDT)
In-Reply-To: <CADkTA4Ox8xXXxk3tZhK_RWJ=UjER-uwQ0tbEBhxusGtaaGxkaw@mail.gmail.com>
References: <001701d0a2a0$ec4b2880$c4e17980$@windriver.com>
	<CADkTA4Ox8xXXxk3tZhK_RWJ=UjER-uwQ0tbEBhxusGtaaGxkaw@mail.gmail.com>
Date: Fri, 26 Jun 2015 09:09:31 -0400
Message-ID: <CADkTA4NFt2=TOJ+OXd4ygr-R2W+kfJYorEKV4RWZX-oorN4A9w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Daniel Badea <daniel.badea@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] tgt: update version to 1.0.37
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
X-List-Received-Date: Fri, 26 Jun 2015 13:09:36 -0000
Content-Type: text/plain; charset=UTF-8

ping. Any luck with that update ?

Bruce

On Wed, Jun 10, 2015 at 4:34 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> I tried to apply this .. but your mailer has corrupted the patch.
>
> While it is simple, and I could fix it .. there's much more value in
> getting your workflow fixed.
>
> The headers show that this was sent with outlook, which likely caused
> the corruption.
>
> The README has the information for using git-send-email:
>
> -------------------------------
> Send pull requests, patches, comments or questions to
> meta-virtualization@yoctoproject.org
>
> When sending single patches, please using something like:
> 'git send-email -1 --to meta-virtualization@yoctoproject.org
> --subject-prefix=meta-virtualization][PATCH'
> -------------------------------
>
> If you did send this with git, then we need to figure out what else may have
> corrupted it.
>
> Bruce
>
> On Tue, Jun 9, 2015 at 6:42 AM, Daniel Badea <daniel.badea@windriver.com> wrote:
>> Signed-off-by: Daniel Badea <daniel.badea@windriver.com>
>> ---
>>  meta-openstack/recipes-support/tgt/tgt_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb
>> b/meta-openstack/recipes-support/tgt/tgt_git.bb
>> index 7796418..fe34858 100644
>> --- a/meta-openstack/recipes-support/tgt/tgt_git.bb
>> +++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
>> @@ -4,8 +4,8 @@ LICENSE = "GPLv2"
>>  LIC_FILES_CHKSUM =
>> "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791
>> b6e29b4c"
>>  DEPENDS = "sg3-utils"
>>
>> -SRCREV = "0ee382bab57a8ecd9ece18d511bd098298478409"
>> -PV = "1.0.36+git${SRCPV}"
>> +SRCREV = "3f779c0338fa7a97d5d0defbdb3ad06167b791d3"
>> +PV = "1.0.37+git${SRCPV}"
>>  PR = "r0"
>>
>>  SRC_URI = "git://github.com/fujita/tgt.git \
>> --
>> 2.1.0
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

