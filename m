Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1803EE00F4B; Thu, 24 Sep 2015 13:40:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.212.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A92C3E006EA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Sep 2015 13:40:02 -0700 (PDT)
Received: by wiclk2 with SMTP id lk2so44980157wic.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Sep 2015 13:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=e0hA/Y9r5wDe6nZtRw0ASX/VEIEL/KERLnTDoBnfSPE=;
	b=zgpmNIWL9sVBzLask9Rk4EUgdRNBkk+5ToubfnXXJlnNaX5y5IcR72WJCa3vBDbXoU
	nASN3ttdxY0xlvjZk5uha3lAE2ntB58PbJBR2l8Ws4ivb8kWGOgCfWTZ+TTBE7mkEF5c
	HjrlEmGRV2uKiBIpdAzTVjgH85h/mjePlvTNOa500jxHOYsw9smifHVUGER6OCvd9nA4
	EfIxpNlpn8Qz5VOD3Pn7yIQC5itXfapgkzCC8xnqITaI2y7ZO/H6BdwJogmnWwnSl40X
	HbLfmuR/uFoSUVaL3oMESI4El7JCY3dYGVyJr9y7GgW+A0tExYVMcuFxidnXFEMx975T
	TIug==
MIME-Version: 1.0
X-Received: by 10.194.113.33 with SMTP id iv1mr1687532wjb.65.1443127201969;
	Thu, 24 Sep 2015 13:40:01 -0700 (PDT)
Sender: asselsm@gmail.com
Received: by 10.194.176.198 with HTTP; Thu, 24 Sep 2015 13:40:01 -0700 (PDT)
In-Reply-To: <20150923165411.GB19243@iapetus.enea.se>
References: <1443026751-57424-1-git-send-email-josep.puigdemont@enea.com>
	<20150923165411.GB19243@iapetus.enea.se>
Date: Thu, 24 Sep 2015 16:40:01 -0400
X-Google-Sender-Auth: WAjNUPPDdzlWJaNTntrSBmZAGak
Message-ID: <CAPuovE+D4J2pbmzQywiW4sd2LcV8mOF9kXiKjdbupQJjfBsG5A@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH] python-glancestore: requires python module enum
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Sep 2015 20:40:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2015 at 12:54 PM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> I for got to mention that the patch should be applicable to
> master too, but I have not run any tests there.

If you are working mostly in Kilo I am happy to try to stay on top of
commits you send against that branch and test them out on master, if
you want to do the same for things I send to master and test them with
Kilo, that would be great :).

I would love to get our basic usecase (boot controller and compute,
log in to horizon, import and image, instantiate an instance...)
working again on both branches.

Mark

>
> /Josep
>
> On Wed, Sep 23, 2015 at 06:45:51PM +0200, Josep Puigdemont wrote:
>> In capabilities, glance store imports enum, which is available
>> since python 3.4. For earlier versions of python we can use
>> the backported package python-enum34 from meta-python.
>>
>> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
>> ---
>>  meta-openstack/recipes-devtools/python/python-glancestore_git.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-openstack/recipes-devtools/python/python-glancestore_git.bb b/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
>> index b3aa2f3..43707ee 100644
>> --- a/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
>> +++ b/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
>> @@ -22,6 +22,7 @@ DEPENDS += " \
>>          "
>>
>>  RDEPENDS_${PN} = " \
>> +   python-enum34 \
>>     python-eventlet \
>>     python-iso8601 \
>>     python-six \
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

