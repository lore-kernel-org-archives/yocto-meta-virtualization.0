Return-Path: <akuster808@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14FD3E0043F; Fri, 25 Jul 2014 12:43:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (akuster808[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.46 listed in list.dnswl.org]
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC235E003C1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jul 2014 12:42:58 -0700 (PDT)
Received: by mail-pa0-f46.google.com with SMTP id lj1so6636888pab.33
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jul 2014 12:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=252alKyYLJ/2lwVNiwELmVHz8ldJU8ZCg/rxZsAw+a8=;
	b=zB+eLsjJ1Mga+QxiAZqdIrB7pO5ebqoZkMvgnLUU5X2/vSXNdFL39BiyY4sLphCjJH
	d7+g/AJoWA9thR4K6yIGsMdkmR75fkRIjuLSaaR92FiV2NyWgqU1WMYDpRcP1x7AwvPM
	Dv/KdGD/LmjS70iDI5GMw3mZDXSKZPR5/q0X5vHxJh8VyVf8UgaA7tgsqUQeh7YaFarQ
	LeCuKNwroHHSEWsZMWLplCiccgS5LCT5U4UpKBzM6tISkAqfg83wcC65LkQ4NlmFOthf
	KYvh7IiYijHM2mR2RqnE68AZHgW281EzAKZYZqusP1YEvruiXwcbd8IPJs71m4trbChc
	hIOw==
X-Received: by 10.70.134.225 with SMTP id pn1mr5184023pdb.146.1406317377644;
	Fri, 25 Jul 2014 12:42:57 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id ia2sm9680383pbb.32.2014.07.25.12.42.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jul 2014 12:42:56 -0700 (PDT)
Message-ID: <53D2B338.906@gmail.com>
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Armin Kuster <akuster@mvista.com>
References: <1404164895-19815-1-git-send-email-akuster@mvista.com>
	<CADkTA4OXMbtPKpfcDHQxRoDAGsGLzBrDJpZEMqV+q8NqOKoczg@mail.gmail.com>
In-Reply-To: <CADkTA4OXMbtPKpfcDHQxRoDAGsGLzBrDJpZEMqV+q8NqOKoczg@mail.gmail.com>
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:40 -0800
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/7] Remove use of PRINC
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
Date: Fri, 25 Jul 2014 19:43:08 -0000
X-Original-Date: Fri, 25 Jul 2014 12:42:48 -0700
X-List-Received-Date: Fri, 25 Jul 2014 19:43:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Bruce,

Where there any objections?

- Armi

On 06/30/2014 09:39 PM, Bruce Ashfield wrote:
> On Mon, Jun 30, 2014 at 5:48 PM, Armin Kuster <akuster@mvista.com> wrote:
>> PR .= instead of PRINC
>>
>
> I have a similar series staged locally, but since I'm out of the
> office, I haven't
> pushed them yet.
>
> I staged these on top of that pending work, and if no one objects, I'll push
> everything at the same time.
>
> Bruce
>
>>
>> Armin Kuster (7):
>>    [meta-openstack] apache2: Remove PRINC reference
>>    [meta-openstack] iptables: remove PRINC reference
>>    [meta-openstack] lighttpd: remove PRINC reference
>>    [meta-openstack] postgressql: remove PRINC reference
>>    [meta-openstack] linux-yocto_3.10: remove PRINC reference
>>    [meta-openstack] linux-yocto_3.14: remove PRINC reference
>>    [meta-openstack] linux-yocto_3.4: remove PRINC reference
>>
>>   meta-openstack/recipes-extended/apache2/apache2_2.4.9.bbappend      | 2 +-
>>   meta-openstack/recipes-extended/iptables/iptables_1.4.21.bbappend   | 2 +-
>>   meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend   | 2 +-
>>   meta-openstack/recipes-kernel/linux/linux-yocto_3.10.bbappend       | 3 ++-
>>   meta-openstack/recipes-kernel/linux/linux-yocto_3.14.bbappend       | 2 +-
>>   meta-openstack/recipes-kernel/linux/linux-yocto_3.4.bbappend        | 2 +-
>>   meta-openstack/recipes-support/postgresql/postgresql_9.2.4.bbappend | 2 +-
>>   7 files changed, 8 insertions(+), 7 deletions(-)
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>

