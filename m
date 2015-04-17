Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ED5DFE009CA; Fri, 17 Apr 2015 05:33:29 -0700 (PDT)
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
	*      [209.85.218.49 listed in list.dnswl.org]
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 767ECE009C2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Apr 2015 05:33:21 -0700 (PDT)
Received: by oift201 with SMTP id t201so75527850oif.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Apr 2015 05:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sAdlp7xJUj/gyDwuACuscziK0sH5P0Skc07i3fnLW84=;
	b=SKxcdx2saOL/ql2y6LnU+hR2EKDNdNqi9jjxGRpYJvCdP7Aihp3j3LRqD1ZiKou78F
	k7LMWMPFbSjDZYmhp3bUoNgKQKAu40DA0tiegFRuoWDSvF2xpye6KcOI9UgoqgEc1Rkq
	5ogJsyQIp2pnBsW7kU8I0d/daqRJWo9p/aM1nJxmn7aw91LR2SfLyXa2v7VHm5kw0yer
	HAL0ZXk9nWimOJOPQB7TmCxwEb3AFnCQvIuYRgXf+RLQ79FraInajRXb4bJkFeGhWUCZ
	vsTvwsCfmTvYefKoQxwM1aJcr4TfufbRZPpVxD4+coDc/5/7gVLFxsnVq3F4Lpfq1p4C
	/2rg==
MIME-Version: 1.0
X-Received: by 10.60.117.5 with SMTP id ka5mr2736465oeb.69.1429274000507; Fri,
	17 Apr 2015 05:33:20 -0700 (PDT)
Received: by 10.202.9.193 with HTTP; Fri, 17 Apr 2015 05:33:20 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AAF0D276D2@ALA-MBA.corp.ad.wrs.com>
References: <1429156721-39898-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CADkTA4N7oqyy1-=WhcCTF+vULC3pXFoiLwXMNhHiOOi-7jXeZg@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF0D27342@ALA-MBA.corp.ad.wrs.com>
	<1B56A49860EB2D45ADE3731B15C959FDAF8060@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B858668EC6A94408DCA5225FDFA85AAF0D276D2@ALA-MBA.corp.ad.wrs.com>
Date: Fri, 17 Apr 2015 08:33:20 -0400
Message-ID: <CADkTA4O5_yUVZCwUvWt-Z8ewW_yX6itrDOKPNiu+H6s9eGj13A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-psycopg2_2.5: The license should be GPLv3+
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
X-List-Received-Date: Fri, 17 Apr 2015 12:33:30 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 17, 2015 at 2:23 AM, Huang, Jie (Jackie)
<Jackie.Huang@windriver.com> wrote:
>
>
>> -----Original Message-----
>> From: Lei, Maohui [mailto:leimaohui@cn.fujitsu.com]
>> Sent: Friday, April 17, 2015 11:42 AM
>> To: Huang, Jie (Jackie); Bruce Ashfield
>> Cc: meta-virtualization@yoctoproject.org
>> Subject: RE: [meta-virtualization] [PATCH] python-psycopg2_2.5: The license should be GPLv3+
>>
>> On April 17, 2015 10:10 AM, Huang, Jie (Jackie) [mailto:Jackie.Huang@windriver.com] wrote:
>>
>> > > > -LICENSE = "GPLv2"
>> > > > +LICENSE = "GPLv3+
>> >
>> > The right quotation mark is missing, which cause parsing error.
>>
>> Sorry.That's my fault. Should I re-submit this patch again ?
>
> Yes, I think you should, and I check that the license should be LGPLv3+, could you check again
> and re-send the patch? Thanks!

I'll just fix it here, since I already merged the patch.

Bruce

>
> Thanks,
> Jackie
>
>>
>>
>> Best Regards,
>> Lei
>>
>>
>> > -----Original Message-----
>> > From: Huang, Jie (Jackie) [mailto:Jackie.Huang@windriver.com]
>> > Sent: Friday, April 17, 2015 10:10 AM
>> > To: Bruce Ashfield; Lei, Maohui
>> > Cc: meta-virtualization@yoctoproject.org
>> > Subject: RE: [meta-virtualization] [PATCH] python-psycopg2_2.5: The
>> > license should be GPLv3+
>> >
>> >
>> >
>> > > -----Original Message-----
>> > > From: meta-virtualization-bounces@yoctoproject.org
>> > > [mailto:meta-virtualization- bounces@yoctoproject.org] On Behalf Of
>> > > Bruce Ashfield
>> > > Sent: Friday, April 17, 2015 3:14 AM
>> > > To: Lei Maohui
>> > > Cc: meta-virtualization@yoctoproject.org
>> > > Subject: Re: [meta-virtualization] [PATCH] python-psycopg2_2.5: The
>> > > license should be GPLv3+
>> > >
>> > > On Wed, Apr 15, 2015 at 11:58 PM, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
>> > > > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
>> > >
>> > > Thanks! I've merged the change.
>> > >
>> > > Bruce
>> > >
>> > > > ---
>> > > >  meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb | 2
>> > > > +-
>> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > > >
>> > > > diff --git
>> > > > a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
>> > > > b/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
>> > > > index c93e62b..ab4fe1f 100644
>> > > > ---
>> > > > a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
>> > > > +++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.b
>> > > > +++ b
>> > > > @@ -1,7 +1,7 @@
>> > > >  DESCRIPTION = "Python-PostgreSQL Database Adapter"
>> > > >  HOMEPAGE = "http://initd.org/psycopg/"
>> > > >  SECTION = "devel/python"
>> > > > -LICENSE = "GPLv2"
>> > > > +LICENSE = "GPLv3+
>> >
>> > The right quotation mark is missing, which cause parsing error.
>> >
>> > Thanks,
>> > Jackie
>> >
>> >
>> > > >  LIC_FILES_CHKSUM = "file://LICENSE;md5=2c9872d13fa571e7ba6de95055da1fe2"
>> > > >  DEPENDS = "postgresql"
>> > > >
>> > > > --
>> > > > 1.8.4.2
>> > > >
>> > > > --
>> > > > _______________________________________________
>> > > > meta-virtualization mailing list
>> > > > meta-virtualization@yoctoproject.org
>> > > > https://lists.yoctoproject.org/listinfo/meta-virtualization
>> > >
>> > >
>> > >
>> > > --
>> > > "Thou shalt not follow the NULL pointer, for chaos and madness await
>> > > thee at
>> > its end"
>> > > --
>> > > _______________________________________________
>> > > meta-virtualization mailing list
>> > > meta-virtualization@yoctoproject.org
>> > > https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

