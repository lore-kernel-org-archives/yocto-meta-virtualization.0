Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 151CCE01757
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Nov 2013 12:28:37 -0800 (PST)
Received: by mail-la0-f49.google.com with SMTP id ev20so862330lab.8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Nov 2013 12:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VFa+jeQ3Dt/IXh7yqHr025V5FJZMHyG+kVY5Ysc/TtM=;
	b=k4rAFGAqpAPzOoOBxMsMDH8VmNIC0hty8DGVIvaJbf5c4bRkSK/rMCpUVAz0C7W9K4
	PhrBpfloYC/26VCRSrPWob4Cm1kW+J7F0aQa+qeSNyyQmU/QnkOwzIIyqqZjHH7FY8if
	Ss9CNeVHolFLVgjhvuAB2sv3z5eNQ9WHIv4ZXyWhHquWDUKsT8WhA/j3/XRAB7DQNtW1
	DmnLHRQDaHQfaGk6I3P7I7IAVkKTpSDslz62rhja46MLWpFT7sChavYAB0oIopN9cuD5
	uaq94lLw1LX2ll9hlV4HuGft0iq/0RgQr9dI4jeoXBDJxyyyWbEkMJvZFVtXPwbJIZat
	WKhA==
MIME-Version: 1.0
X-Received: by 10.152.3.42 with SMTP id 10mr7829029laz.22.1383856116134; Thu,
	07 Nov 2013 12:28:36 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Thu, 7 Nov 2013 12:28:36 -0800 (PST)
In-Reply-To: <527A4247.80105@twobit.us>
References: <1383707342-3827-1-git-send-email-cjp256@gmail.com>
	<1383707342-3827-4-git-send-email-cjp256@gmail.com>
	<527A4247.80105@twobit.us>
Date: Thu, 7 Nov 2013 15:28:36 -0500
Message-ID: <CADkTA4Oq_KqcarNDBUq1eBErXhJrw3Rohrq6RYFoSj0wi_0AnQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 4/4] xen: upgrade to 4.3.1
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
X-List-Received-Date: Thu, 07 Nov 2013 20:28:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 6, 2013 at 8:21 AM, Philip Tricca <flihp@twobit.us> wrote:
> All of this looks good to me but I'm not seeing PATCH 2/4.

Hah. I was just trying to merge this .. and was wondering the same thing.

Chris: can you put the changes on a github repo or other source for me to
pull ?

Bruce


>
> - Philip
>
> On 11/05/2013 10:09 PM, Chris Patterson wrote:
>> Changelog available at:
>> http://xenproject.org/downloads/xen-archives/supported-xen-43-series/xen-431.html
>>
>> Signed-off-by: Chris Patterson <cjp256@gmail.com>
>> ---
>>  recipes-extended/xen/{xen_4.3.0.bb => xen_4.3.1.bb} | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>  rename recipes-extended/xen/{xen_4.3.0.bb => xen_4.3.1.bb} (99%)
>>
>> diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.1.bb
>> similarity index 99%
>> rename from recipes-extended/xen/xen_4.3.0.bb
>> rename to recipes-extended/xen/xen_4.3.1.bb
>> index f1067bc..6985624 100644
>> --- a/recipes-extended/xen/xen_4.3.0.bb
>> +++ b/recipes-extended/xen/xen_4.3.1.bb
>> @@ -11,8 +11,8 @@ SRC_URI = " \
>>      file://flask-avoid-installing-policy-file-as-boot.patch \
>>      "
>>
>> -SRC_URI[md5sum] = "7b18cfb58f1ac2ce39cf35a1867f0c0a"
>> -SRC_URI[sha256sum] = "e1e9faabe4886e2227aacdbde74410653b233d66642ca1972a860cbec6439961"
>> +SRC_URI[md5sum] = "7616b8704e1ab89c81f011f0e3703bc8"
>> +SRC_URI[sha256sum] = "3b5b7cc508b1739753585b5c25635471cdcef680e8770a78bf6ef9333d26a9fd"
>>
>>  S = "${WORKDIR}/xen-${PV}"
>>
>> @@ -215,11 +215,11 @@ FILES_${PN}-libfsimage-dev = "${libdir}/libfsimage.so"
>>  FILES_${PN}-fsimage = "${libdir}/fs/*/*fsimage.so"
>>
>>  FILES_${PN}-hypervisor = "\
>> -    /boot/xen-4.3.0.gz \
>> +    /boot/xen-4.3.1.gz \
>>      /boot/xen-4.3.gz \
>>      /boot/xen-4.gz \
>>      /boot/xen.gz \
>> -    /boot/xen-syms-4.3.0 \
>> +    /boot/xen-syms-4.3.1 \
>>      "
>>
>>  FILES_${PN}-base = "\
>>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

