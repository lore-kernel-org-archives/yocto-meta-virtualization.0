Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6393E00C98; Fri,  9 Oct 2015 12:05:28 -0700 (PDT)
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
	*      [209.85.160.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1BA7CE00AD5
	for <meta-virtualization@yoctoproject.org>;
	Fri,  9 Oct 2015 12:05:27 -0700 (PDT)
Received: by ykba192 with SMTP id a192so83254687ykb.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 09 Oct 2015 12:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LTDvYn1IfD5F4mGecTEFvTRdDBKuGIAcfjdfpmXPu1A=;
	b=ZwxHndiY9YiKhYv9L5AfJqXOskJTn/ZxHAYPrnxgVrdAw2Sso49jrwLActB4rZypeL
	nsXZXryOxRN8EoV7t82g9iy6eQOJLklHqgGsJmBbi1O7uEXmuSwBYA8r5RoX1DdrICCe
	OiNyTJ2J5BSuH88Wfo17ogIab951LcHUwSJJJHnT8WY1VfqTBL4hPfYYfjDPy4eDalZG
	RvSHGbvnLR72AX2tayecgoKDGUJ3X/kl+tPwdX3S5KnY+4n74DjrluA9qAaXfTFtl0iq
	xSgeuyvs7OzOu1mecPug78esj0l1BDazOGoLlIcVNkG1Ih7IAMWe2eeQBiC/OoVFDeFO
	Mrpg==
MIME-Version: 1.0
X-Received: by 10.13.202.136 with SMTP id m130mr11214688ywd.127.1444417527329; 
	Fri, 09 Oct 2015 12:05:27 -0700 (PDT)
Received: by 10.13.217.201 with HTTP; Fri, 9 Oct 2015 12:05:27 -0700 (PDT)
In-Reply-To: <20151009153045.GA4447@iapetus.enea.se>
References: <1444404405-54190-1-git-send-email-josep.puigdemont@enea.com>
	<20151009153045.GA4447@iapetus.enea.se>
Date: Fri, 9 Oct 2015 15:05:27 -0400
Message-ID: <CADkTA4M0FoYFi33rgjqC8tre2NbfhS+E732xxG1L9HhVT4+qpw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] openstack-base.bbclass: do not overwrite hosts file
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
X-List-Received-Date: Fri, 09 Oct 2015 19:05:28 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 9, 2015 at 11:30 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> oops, sorry, this patch should not have been sent! :-/

ignored!

Bruce

> (and it is not good either)
> /Josep
>
> On Fri, Oct 09, 2015 at 05:26:45PM +0200, Josep Puigdemont wrote:
>> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
>> ---
>>  meta-openstack/classes/openstack-base.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-openstack/classes/openstack-base.bbclass b/meta-openstack/classes/openstack-base.bbclass
>> index 718aa1c..5ecbd21 100644
>> --- a/meta-openstack/classes/openstack-base.bbclass
>> +++ b/meta-openstack/classes/openstack-base.bbclass
>> @@ -7,6 +7,6 @@ openstack_configure_hosts() {
>>
>>      echo "${CONTROLLER_IP} ${CONTROLLER_HOST}" >> ${IMAGE_ROOTFS}/etc/hosts
>>      echo "${COMPUTE_IP} ${COMPUTE_HOST}" >> ${IMAGE_ROOTFS}/etc/hosts
>> -    echo "${MY_HOST}" > ${IMAGE_ROOTFS}/etc/hostname
>> +    echo "${MY_HOST}" >> ${IMAGE_ROOTFS}/etc/hostname
>>  }
>>
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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

