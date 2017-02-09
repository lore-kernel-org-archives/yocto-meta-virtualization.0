Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3FDD7E00A51; Thu,  9 Feb 2017 06:19:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.195 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB09EE00A3B
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Feb 2017 06:19:12 -0800 (PST)
Received: by mail-yw0-f195.google.com with SMTP id q71so362272ywg.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 09 Feb 2017 06:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/k6zlMhtvOBa9rLLZ2GSOwiqQ1j6MFiRYyqtpelTL3o=;
	b=r5V8ZUXVLsE3zuN0dgiBF6i38TWdOW2+Io6lI1wEuKdp0hW7HGxwtllfQwzVdkwZSp
	7kPvOc/nDXJ2WrVsKbaw+B77ruXc9ZLQWCT0T5Vb2kV6DM/uIthiMeTNMtstn772xW4S
	9U43dk/TWlAY9PJ6509ZBuBZ/l38CjwM5I0bHUJsHCYPOicMfyAbOrGkU5QaXbYeVXgq
	BqbPWl/kQjVMaia8pnj8VJINObJcHZbIMuv9b2W/Nui2vTyuC8QbfmmaPO9Ns+hswVmZ
	nAb/8prvT9qyszhltukwwQsRWLv6R9khhn2mCOdiHcPUnVdf64x6YQtpgEk2Qrrnnk9Q
	hu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=/k6zlMhtvOBa9rLLZ2GSOwiqQ1j6MFiRYyqtpelTL3o=;
	b=c/8tC3Z+3AAFuObxF/+Jake0Z4lEwyEE0hW6waegmoF2fVH16u8QtjFyGE90c3HRZ8
	FVNIOMiMh5DlkUuKTgL1DrlE4+tYP7xX9gkbbfOkRDBLc26xuv0YZYwCkqc2AgotWAV2
	jZ/Kf+JxXM6xXJf8XdMszrJEIbZmLRKWJ6ADoPPrsZa2UY3jL0B6i7JjBuOLaOyvS7ck
	slIll7+qwI1ihZqRPvliMpktdtnzt6sNUUpOMjZGwhwifSbY6GCYEE0lcdZ+gjmYFnMA
	R0g9j7J6mkJmwLkJ8fZ/e4y5iXvwoV/7Ns9fI14bhkcFkzTnHnvzEp2NqZZWtiOyZlIi
	5qMw==
X-Gm-Message-State: AMke39nMQvqyv7OmThQNCk/tfJwUaws3eEmiJNWPqBdiweF7yrMf1lCHqhiiznM5JZd6CW+T5KiV3F0QAd7S9w==
X-Received: by 10.129.68.8 with SMTP id r8mr2359050ywa.169.1486649951649; Thu,
	09 Feb 2017 06:19:11 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.21.66 with HTTP; Thu, 9 Feb 2017 06:19:11 -0800 (PST)
In-Reply-To: <b7e4db56-9375-5c35-7232-cf7bb1958edd@windriver.com>
References: <1486576408-24433-1-git-send-email-mark.asselstine@windriver.com>
	<b7e4db56-9375-5c35-7232-cf7bb1958edd@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Thu, 9 Feb 2017 09:19:11 -0500
X-Google-Sender-Auth: K4pxX3bYnuzrITaGao9b8-DTMww
Message-ID: <CAPuovEJ8xGVK_1YoLVn9uk2p33aMUHkTsM_UupK7R+AO7R4JUw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/3] go-native: rename to go-initial-native
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
X-List-Received-Date: Thu, 09 Feb 2017 14:19:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 9, 2017 at 9:15 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> I've merged the 3 patches in this series.
>
> Bruce

Great. For anyone watching I will continue to look into why docker is
not fully functional. I have some other demands for my time so if you
happen to resolve the issue please send along your patches, don't wait
for me.

Mark

>
>
> On 2017-02-08 12:53 PM, Mark Asselstine wrote:
>>
>> With the new per recipe sysroots we were having build issues since the
>> bootstrap version of go (go-native 1.4) was being found and not the
>> go-cross (1.6) we are expecting. This results in errors such as the
>> following when building packages such as containerd:
>>
>>   _cgo_.o: decoding dwarf section info at offset 0x4: unsupported version
>> 0
>>
>> This is caused by the dependency tree built up to prepare the per
>> recipe sysroot. Since recipes like containerd DEPEND on go-cross and
>> go-cross DEPENDS on go-native both are installed but unlike the old
>> global sysroot the dependency parsing order results in go-native being
>> last, overwriting go-cross. You can see this by running a devshell for
>> containerd and running 'go version'.
>>
>> By adding '-initial' in the name we exploit functionality in
>> sstate.bbclass that is already in place to handle gcc-initial and
>> similar. This results in only explicit DEPENDS on go-native being
>> enforced, so in the case of containerd we only get a dependency on
>> go-cross and we therefor get go 1.6 as expected.
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ---
>>  recipes-devtools/go-cross/go-cross.inc                                | 4
>> +++-
>>  .../go-cross/{go-native_1.4.bb => go-initial-native_1.4.bb}           | 0
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>  rename recipes-devtools/go-cross/{go-native_1.4.bb =>
>> go-initial-native_1.4.bb} (100%)
>>
>> diff --git a/recipes-devtools/go-cross/go-cross.inc
>> b/recipes-devtools/go-cross/go-cross.inc
>> index 7f74903..857fbd5 100644
>> --- a/recipes-devtools/go-cross/go-cross.inc
>> +++ b/recipes-devtools/go-cross/go-cross.inc
>> @@ -1,7 +1,9 @@
>>  inherit cross
>>
>>  # libgcc is required for the target specific libraries to build properly
>> -DEPENDS += "go-native libgcc virtual/${TARGET_PREFIX}gcc"
>> +DEPENDS += "go-initial-native libgcc virtual/${TARGET_PREFIX}gcc"
>> +
>> +do_compile[depends] += "go-initial-native:do_populate_sysroot"
>>
>>  # Prevent runstrip from running because you get errors when the host arch
>> != target arch
>>  #INHIBIT_PACKAGE_STRIP = "1"
>> diff --git a/recipes-devtools/go-cross/go-native_1.4.bb
>> b/recipes-devtools/go-cross/go-initial-native_1.4.bb
>> similarity index 100%
>> rename from recipes-devtools/go-cross/go-native_1.4.bb
>> rename to recipes-devtools/go-cross/go-initial-native_1.4.bb
>>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

