Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7DAC9E00AF9; Mon, 13 Nov 2017 05:35:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A17FDE00AF9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 05:35:18 -0800 (PST)
Received: by mail-qt0-f175.google.com with SMTP id d9so19474115qtd.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 05:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ndnp3XK05X1YeknrlF5ctWZHQ/2JofurvEXbeh9Npy4=;
	b=cm/mAgZIaOdTCtr/tbKjEiJqL9EDFJKkVP/3jq5cMpWGvekNWPlzWmaby7wzAZAL5Z
	jBl4EMjRFrPOVauqgzZ39B2EbxWqQLD4z5exIpYJie9AiEdfFNK4ejQfWM6g/iXdKqZ5
	wTTZAzYyaMMbdLYytFDx8rmIIbsyNZfy+3v6UU8DSvcsHPkf0n6AnIpXHUqFap61OPw+
	MY6IexfzXGFX9CrPe+LRotUvYC/mZ38hM1BL7nySSGnfVTOZ/YCK2si6xPuQ3pQljOYa
	OWZEyTX4bNkrPmj9CuIBCrnDRnWLk53a9b/sdgwjflllqLzl+5b55QVuORqliJDpTRN1
	8Siw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ndnp3XK05X1YeknrlF5ctWZHQ/2JofurvEXbeh9Npy4=;
	b=MKUtPFEmIeFt1vfYuKIYfepDHe3+Q2wATJzuhDSw32Qts/YkJxgktG3FbP4CyOej7H
	5F3vmWap4uKw6bvdCVCmBjrD6vhnkiZLeyIGXgTZD+IqnigszChiYAQiThmSZAsDBCPR
	6QiQUEDrVXhSk/zw4AZZypzQsiG8XYzzgmqXu3RS12G8YWFZWl0z1q7PF0bhkLIMwtie
	wGCtkEWM6gm5sbw0IC+ybWWtBvyQkIWwP7ZwLjDnRpWmH2Ux6Sfnn8DX1CuO8iCYBWg5
	tg0/21foyOckhfv3vACfbNbYs3t1KV/s3a8rwK6JVgOx5Aw66w0FPUUze/jLbhAodFcM
	W8PQ==
X-Gm-Message-State: AJaThX5h0y6bBXA2YHu2waKBJ361Nz1pyf4T8Q/fYeD9L5Tm512kQ66f
	I77yOtKLExbhZDu3lmYNW+k1VeQDAURWci98tl8=
X-Google-Smtp-Source: AGs4zMYmXiYj9aCzRoxRGlN11r2YKK6gU5uUa96sdwJM5Lhsdxd104a02tHVSq0oakUI1NrbYD/rJPmzShJmwIXYdGs=
X-Received: by 10.200.36.150 with SMTP id s22mr14439023qts.237.1510580117618; 
	Mon, 13 Nov 2017 05:35:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Mon, 13 Nov 2017 05:35:17 -0800 (PST)
In-Reply-To: <CAPaNuAsyk+KMAJxO+P31Ku8nCQPWpG6qDuEq4Rym8i=WoQ62MA@mail.gmail.com>
References: <CAPaNuAsAX0tZORrXY+PGRoPa2g=_Mwou_64PExf9sE8xNw7ybg@mail.gmail.com>
	<CAPaNuAsyk+KMAJxO+P31Ku8nCQPWpG6qDuEq4Rym8i=WoQ62MA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 13 Nov 2017 08:35:17 -0500
Message-ID: <CADkTA4NE9t6V6eUTRAtS96Gn7wEokuS+o2vGdj9D25u=kEupdg@mail.gmail.com>
To: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: delete references to xenstored.socket and xenstored_ro.socket in xen.inc
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
X-List-Received-Date: Mon, 13 Nov 2017 13:35:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 13, 2017 at 4:40 AM, Yan Yankovskyi
<yan.yankovskyi@globallogic.com> wrote:
> So, what do you think about this patch? Presence of references to these
> files breaks out of box xen build, and no one cares. Am I missing something,
> or just so few people use xen?

Check the mailing list archive in the past months. There are multiple, active
Xen users sending patches (upgrading and fixing) .. so they are clearly
building.

As I mentioned, I'd like a full v2 repost so they can comment. I no longer have
the original patch, and maybe others don't as well .. they can't apply a quoted
reply of the old patch, so it needs to be resent to restart the conversation.

Cheers,

Bruce

>
> On Mon, Nov 6, 2017 at 3:24 PM, Yan Yankovskyi
> <yan.yankovskyi@globallogic.com> wrote:
>>
>> These files were removed since the followine patch
>>
>> http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=976ce01e103fc03bb3336cdbc6c951a709e285fe
>> and are absent in xen 4.8.0 and further, which leads to
>> the following error during the Xen build process:
>> do_package: SYSTEMD_SERVICE_xen-xencommons value xenstored.socket does not
>> exist
>>
>> Signed-off-by: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
>> ---
>>  recipes-extended/xen/xen.inc | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>> index cb314f8..4d56de9 100644
>> --- a/recipes-extended/xen/xen.inc
>> +++ b/recipes-extended/xen/xen.inc
>> @@ -739,8 +739,6 @@ FILES_${PN}-xencommons += "\
>>      ${systemd_unitdir}/system/xenconsoled.service \
>>      ${systemd_unitdir}/system/xen-init-dom0.service \
>>      ${systemd_unitdir}/system/xenstored.service \
>> -    ${systemd_unitdir}/system/xenstored.socket \
>> -    ${systemd_unitdir}/system/xenstored_ro.socket \
>>      ${systemd_unitdir}/system/var-lib-xenstored.mount \
>>      "
>>
>> @@ -780,8 +778,6 @@ SYSTEMD_SERVICE_${PN}-xencommons = " \
>>      xenconsoled.service \
>>      xen-init-dom0.service \
>>      xenstored.service \
>> -    xenstored.socket \
>> -    xenstored_ro.socket \
>>      "
>>  SYSTEMD_SERVICE_${PN}-xendomains = "xendomains.service"
>>
>> --
>> 2.7.4
>>
>> --
>> Best regards,
>>
>> Yan Yankovskyi | Associate Software Engineer, Ukraine
>> GlobalLogic
>> M  +380.95.049.64.73   Skype huandesale
>>
>> www.globallogic.com
>>
>> http://www.globallogic.com/email_disclaimer.txt
>
>
>
>
> --
> Best regards,
>
> Yan Yankovskyi | Junior Software Engineer, Ukraine
> GlobalLogic
> M  +380.95.049.64.73   Skype huandesale
>
> www.globallogic.com
>
> http://www.globallogic.com/email_disclaimer.txt



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

