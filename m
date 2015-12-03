Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A977FE005B3; Thu,  3 Dec 2015 09:34:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90A63E00349
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Dec 2015 09:34:28 -0800 (PST)
Received: by wmec201 with SMTP id c201so32369969wme.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 03 Dec 2015 09:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:date:message-id:subject:from:to:cc
	:content-type; bh=9I2ibv9D3WYa7r+qinncewlyLMi7rwOpr1EEOfwptnk=;
	b=HdDuCtQdVO02jAYoyiSC49+CxnMwhVwSs6e+UUUujGq4ca5WYjLOrMLUNBv+hX2eAZ
	gJoLvhF9vS1K1IrJyBOtgjlxMedj9/VcV/V6nnXdYS+f8SqJCDM1JRQthTWh0zX/Q797
	qKZIXxa6pkgAUGnNpCthoE8da0q2RZDbYc7Ysh3cmOvVzjE9QiDr7htHjIpYlNNalIF3
	wmcZlmTBl+IRqasOjpldTUc0U20STfGb6bNgRKsnj0bQKQt6ogxH4bipZVpCS55lPMic
	KjVgLUVmOHdgPO+C5WhZcFrHBrY/yI/+qv/UtzwzC0gX6ji5TkZ4ydGQOUnwqFqyxsq1
	8DBQ==
MIME-Version: 1.0
X-Received: by 10.194.175.230 with SMTP id cd6mr14048281wjc.100.1449164067473; 
	Thu, 03 Dec 2015 09:34:27 -0800 (PST)
Sender: asselsm@gmail.com
Received: by 10.194.59.176 with HTTP; Thu, 3 Dec 2015 09:34:27 -0800 (PST)
Date: Thu, 3 Dec 2015 12:34:27 -0500
X-Google-Sender-Auth: CRopUUnHRV9wnQntx-kUWwTMmFk
Message-ID: <CAPuovEJTm8DXRDksyLDV6ts-31-SMBFAQptg=c8ySnRGJOxs8g@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH 00/13] cherry picks from master
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
X-List-Received-Date: Thu, 03 Dec 2015 17:34:31 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 2, 2015 at 11:16 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> On Tue, Dec 01, 2015 at 09:37:08AM -0500, Bruce Ashfield wrote:
>>
>>
>> On Thu, Nov 26, 2015 at 10:47 AM, Josep Puigdemont <josep.puigdemont@enea.com>
>> wrote:
>>
>>     Hi,
>>     this is a collection of cherry-picks from master to fido-kilo (commit short
>>     hash in parantheses)
>>     This is part of a more complete patch set to bring fido-kilo to a more
>>     functional state.
>>
>>
>> A noble goal :) Same as we are working on for master and liberty, before
>> jumping to the latest.
>
> mmm, I guess we're noble people... :) I didn't want to touch master too
> much because I didn't know what the direction was exactly, but hearing
> that you're working on Liberty is excellent news! I might be able to
> give a hand when it hits the repo (or is there a development repo I
> could take a peek?)

I am working on this in my 'free time'. I hope to have things sent out
in about a week. I have already sent out some stuff to oe as I have
already found some dependencies that they host that need uprevs. Stay
tuned.

Mark

>
>>
>> I've merged the whole series.
>
> Thanks! There are more on the way... ;-)
>
> /Josep
>>
>> Bruce
>>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

