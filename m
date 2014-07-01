Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A65BBE003D2; Tue,  1 Jul 2014 14:14:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.41 listed in list.dnswl.org]
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47332E00289
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 Jul 2014 14:14:34 -0700 (PDT)
Received: by mail-pa0-f41.google.com with SMTP id fb1so11314968pad.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 Jul 2014 14:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=/hrydZigXaGh0GnCk29ZQ6cJeOprctSqrbY7+DbURuA=;
	b=R9HPxdLjeGrSdhYuOltjGvTB5kzvEHXSX7kASD2rVVE3BwmcnrUzeHy4L7Rugsgv5z
	JvKBvGuh0013b/bpfcxqylVd/3s/aTvSscWan7HZXILfunZPTRGyWdj5sUjG5YeqifFZ
	mExhn/a8JkJU1qZdErA3zdJ8i5xR7tHfOfKbhgSfvygt0sARRs2zXXBYHYs9EJ/tHfSc
	rFjfLSAiIeE7+mpH+TSIJ9epQkh4GnR9C923ppnYS+WLbUD0fHi6G3MTOiWIKJmVB+j3
	YddBBn4psj8nBNg8idI1iYwep1i0FagtfQxWGnjw2K5JYLg6XZvrIx8QwSn8R/L++UYY
	1PDQ==
X-Gm-Message-State: ALoCoQkQvY4PIXVIeR9xLAQuYYsrRN72zCpIDVa6YboZRjztRbzq/dd/I4OwN7kCM0Zzg6nEvGJT
X-Received: by 10.68.173.1 with SMTP id bg1mr65669309pbc.13.1404249274103;
	Tue, 01 Jul 2014 14:14:34 -0700 (PDT)
Received: from [10.7.100.231] (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id
	yv7sm120822455pac.33.2014.07.01.14.14.33 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Jul 2014 14:14:33 -0700 (PDT)
Message-ID: <53B324B8.9040906@mvista.com>
Date: Tue, 01 Jul 2014 14:14:32 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1404164895-19815-1-git-send-email-akuster@mvista.com>
	<CADkTA4OXMbtPKpfcDHQxRoDAGsGLzBrDJpZEMqV+q8NqOKoczg@mail.gmail.com>
In-Reply-To: <CADkTA4OXMbtPKpfcDHQxRoDAGsGLzBrDJpZEMqV+q8NqOKoczg@mail.gmail.com>
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
X-List-Received-Date: Tue, 01 Jul 2014 21:14:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Bruce,

works for me.

Have a good time off.

- Armin

On 06/30/2014 09:39 PM, Bruce Ashfield wrote:
> On Mon, Jun 30, 2014 at 5:48 PM, Armin Kuster <akuster@mvista.com> wrote:
>> PR .= instead of PRINC
>>
> I have a similar series staged locally, but since I'm out of the
> office, I haven't
> pushed them yet.
>
> I staged these on top of that pending work, and if no one objects, I'll push
> everything at the same time.
>
> Bruce
>
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


