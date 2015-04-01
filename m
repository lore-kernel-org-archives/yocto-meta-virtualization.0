Return-Path: <vomegaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72B76E008EA; Wed,  1 Apr 2015 09:13:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.212.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7461E0056E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  1 Apr 2015 09:13:41 -0700 (PDT)
Received: by wiaa2 with SMTP id a2so72792512wia.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 01 Apr 2015 09:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zPNUv9CBuR0wG5HrwKTjOhWdRsZQzPMN02lvh+vONrU=;
	b=Smj1vdBCCcfILUCrUsNa9t4KG6yOdFoqaPGis3sZn7N91UPvu/HfqyBj0sAgFsFpY3
	0q2guskyjZd5iEm0KRV3iUkwKwrsB2lAManHMTFBH+KsisRDG1o91v1b9cqW4UE6qDpS
	SGMovz9Sj/1ujetm2i1OZY9EyWs3kyyxPnAIIkJCwTXMovO4jJwBpaPxsOQUZ5FYpbLj
	NI6RGSxfXKZwfE+uuM45kn9tC2InWn0E5eNX09P6qdKbW9PYyJgeiAsgCgaxsbT4ninN
	6rYjkUvvwTSbJUIa8PyVq2RB5ap2CSPGQRsGiTIBddEBgKWDbfjqee/3HGK1AlMoCNvl
	W/lg==
X-Received: by 10.194.187.46 with SMTP id fp14mr55456837wjc.86.1427904820110; 
	Wed, 01 Apr 2015 09:13:40 -0700 (PDT)
MIME-Version: 1.0
Sender: vomegaz@gmail.com
Received: by 10.28.170.72 with HTTP; Wed, 1 Apr 2015 09:12:59 -0700 (PDT)
In-Reply-To: <CAPuovEK8Ta1x-OOR4mBA0G4_r7P_LJOx93p86HhMF5JCg-+rnQ@mail.gmail.com>
References: <CAPuovEK8Ta1x-OOR4mBA0G4_r7P_LJOx93p86HhMF5JCg-+rnQ@mail.gmail.com>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Wed, 1 Apr 2015 18:12:59 +0200
X-Google-Sender-Auth: sJkHss_khkdiOkFsEojnMBmwBhc
Message-ID: <CAGXeWgnkx_-hXBXCBt-vmBqzb8PEypZYL6KnN+pw+ipJ1T4_cQ@mail.gmail.com>
To: "M. Asselstine" <asselsm@mcmaster.ca>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: ERROR: Layer 'networking-layer' depends on layer 'meta-python'
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: thomas.perrot@tupi.fr
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Apr 2015 16:13:43 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Yes, there has a patch, see the email entitled "[meta-virtualization]
[PATCH] README: add missing meta-python dependency"
-----------------------------------------------------------------------------------------
http://fr.linkedin.com/pub/thomas-perrot/37/436/876
https://plus.google.com/u/0/111501193434241021399
https://github.com/tprrt


On Wed, Mar 25, 2015 at 5:46 PM, M. Asselstine <asselsm@mcmaster.ca> wrote:
> On Mon, Mar 23, 2015 at 9:44 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:
>> trying to build $ bitbake kvm-image-minimal with Ubuntu 13.10 host, poky
>> 1.7.1
>> and following README inside meta-virtualization to setup me-virtualization,
>> oe-core, meta-oe dependencys,
>>
>> got following error messge:
>> $ bitbake kvm-image-minimal
>> ERROR: Layer 'networking-layer' depends on layer 'meta-python', but this
>> layer is not enabled in your configuration
>
> This reminded me that I had a patch queued to send to update the
> README. Sent now.
>
> Regards,
> Mark
>
>>
>>
>> should meta-oe/meta-python added other than meta-oe, meta-networking and
>> meta-filesystems as README said?
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

