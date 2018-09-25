Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 989FDE00718; Tue, 25 Sep 2018 14:41:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78A0BE006AF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 14:41:15 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id y71-v6so6752958lje.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 14:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tR1r+85H0nM+vLpQui8IYaCPdhXAnRyrQmw50Qhy59E=;
	b=O1Fj6CYEMppSHGOjS3T27/oCzVDJDwgknyRcBs4dpap5nElgurb+iAaqyAr6vTwTMZ
	0znKfUUUGg7qSn6g+Pfg886u+ozR08sFcnpQx/fEJb1Kn+6F4YXMssJUOSaqlfI59Lbk
	nlNld/rFvrGmEkvp5z4nd7LvP/YzCQ0PQM20s0duGd8MPytvoDCe/WMKJg3mOBP84n09
	DNCNVWQwQjIZcaQ+PQDuuguUKMDQ3coNe/xGmebdC+w01Bhl5zqCv9gcmcegtM1H7mJA
	71tGliS2K612q8DXOvKZN1mQbuVmaAeDr0s0cZxxRuH6e8CYliz2XHySnPDlXbmnODww
	ob4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tR1r+85H0nM+vLpQui8IYaCPdhXAnRyrQmw50Qhy59E=;
	b=b88VaH58FOJ8qUwT11Ud7G/iMb4XJjK1CaBvvyHZd4nbsvIYFnu/Fp8qRhFDqzIBCa
	ZDXrvJXAzjpazv/vUIexms2QPaa+5RMv5q2AU4A/Rq/jbAC+kHejIDk+azqNBmYuOaA5
	owhsL2dQmsX20Is2n5Tdha3tJNw5JaI8VWTvtTjIgkHNFFMcZulHmKW/WThfDCHA20e3
	LEhh9+D7eCYp1iptepMqF27pf1Albr6ndSEtl6rpOgjPWZC47xj+UWqlLDS0GqDz+etO
	CegbXQ9g8i+Su0PfqWLfYXjpks5FiD2g3AMFwko5nQXzqug8rnfXOWdVcBXCcIvluMy8
	+vSQ==
X-Gm-Message-State: ABuFfoiA/JR8R1aus8EKJJlSmPMs+Q7l44hKcxKGe631hlG5ojxz9fRA
	u8rhsOKMqYksAFrXnrwcsZgMcvrk8fCoXbWw6RNkjw==
X-Google-Smtp-Source: ACcGV62M957duyKEf8nEGBQLyboLq7pZu5/4KDU5DnaoKu6GW+AGWlGwORpEEsaOSziInZbPlOEwqLi9LQ8DpT1Dexg=
X-Received: by 2002:a2e:4702:: with SMTP id
	u2-v6mr2168235lja.147.1537911674242; 
	Tue, 25 Sep 2018 14:41:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9691:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 14:41:13
	-0700 (PDT)
In-Reply-To: <1537302451-32569-1-git-send-email-mark.asselstine@windriver.com>
References: <1537302451-32569-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Sep 2018 17:41:13 -0400
Message-ID: <CADkTA4MDmDorsp3tNmqMEaiMLWRRvtm2qgZYctqjLQ4rD3009g@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 0/6] Move recipes from meta-overc
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
X-List-Received-Date: Tue, 25 Sep 2018 21:41:17 -0000
Content-Type: text/plain; charset="UTF-8"

merged!

Bruce

On Tue, Sep 18, 2018 at 4:27 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> There have been requests from people who are not interesting in
> meta-overc to have more readily available access to these
> recipes. Since meta-overc depends on meta-cloud-services and these
> recipes have no specific bindings to OverC it is possible to locate
> them here without affecting meta-overc or the OverC framework.
>
> With all of these changes applied people will be able to build these
> recipes without having to include meta-overc in the bblayers.conf. If
> you do happen to apply only the initial copy and not the full set of
> changes you will need to include meta-overc in your bblayers.conf.
>
> NOTE that consul-migrate is specific to DB migrations for older
> versions of consul and really is no longer applicable and should most
> likely be dropped at some point. I am including it here for
> completeness and will most likely follow up with a removal in the near
> future.
>
> Mark
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

