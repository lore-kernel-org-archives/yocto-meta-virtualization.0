Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2E58E00740
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Jan 2013 04:28:14 -0800 (PST)
Received: by mail-la0-f49.google.com with SMTP id fk20so1292083lab.8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Jan 2013 04:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=rSavIkveARIQeA8VgJBzNqMR8LEOrpfiVpKZZuicxuE=;
	b=bldOxuoe9U3twxb88bth/v0iW7A3T6FnsO2Xjm5jp2CWYa5x/b5etczmu2vuX5t0bL
	LtzmhiGJP9tItu3MvJ9WHEpEorX2lCEsLg7a3HEZt4kWBMEPt1G3gj5NZYAuKnstb67P
	nDEBAO5nsazqwQ/5OhSPrKorZUtmYjLuAezrh6zVWbk7ivHohBTU/Vu5ZE6W8UPmn4n8
	wL57ajNps/XMG2C37EczjHWnZWjVIjmF3k65cY1zGfByA2cf9QUQojC+pJb6N+XX6i6D
	uW4XwPMGoKeHjE+LKJjMDAgqq7iQXG1oULOL+Z9cmeOSSmznbYuzNaPsovkufs0GSwUN
	OZRA==
X-Received: by 10.112.16.203 with SMTP id i11mr538824lbd.135.1358339293115;
	Wed, 16 Jan 2013 04:28:13 -0800 (PST)
Received: from [172.16.140.29] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id f8sm8030799lbg.2.2013.01.16.04.28.11
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 04:28:12 -0800 (PST)
Message-ID: <50F69CD7.5060806@gmail.com>
Date: Wed, 16 Jan 2013 13:28:07 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Mihai Prica <mihai.prica@intel.com>
References: <1357921745-18046-1-git-send-email-mihai.prica@intel.com>
	<50F402FB.304@gmail.com>
In-Reply-To: <50F402FB.304@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] ebtables: Fixed typo in RRECOMMENDS
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
X-List-Received-Date: Wed, 16 Jan 2013 12:28:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon 14 Jan 2013 02:07:07 PM CET, David Nyström wrote:
> On 01/11/2013 05:29 PM, Mihai Prica wrote:
>> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
>> ---
>>   recipes-extended/ebtables/ebtables_2.0.9-2.bb |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/ebtables/ebtables_2.0.9-2.bb
>> b/recipes-extended/ebtables/ebtables_2.0.9-2.bb
>> index 15213cb..66c7b95 100644
>> --- a/recipes-extended/ebtables/ebtables_2.0.9-2.bb
>> +++ b/recipes-extended/ebtables/ebtables_2.0.9-2.bb
>> @@ -23,7 +23,7 @@ S = "${WORKDIR}/ebtables-v${PV}"
>>   ASNEEDED_pn-${PN} = ""
>>
>>   #Load the necessary kernel modules
>> -RECOMMENDS_${PN} += "kernel-module-ebtables \
>> +RRECOMMENDS_${PN} += "kernel-module-ebtables \
>>                        kernel-module-ebtable-nat \
>>                        kernel-module-ebtable-filter \
>>                        kernel-module-ebtable_broute \
>>
>
> +1

Merged to master,
Thanks.

