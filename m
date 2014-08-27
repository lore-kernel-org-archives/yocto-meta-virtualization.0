Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8DE71E007DB; Wed, 27 Aug 2014 11:39:05 -0700 (PDT)
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
	*      [209.85.215.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F0C1E007B9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Aug 2014 11:38:58 -0700 (PDT)
Received: by mail-la0-f44.google.com with SMTP id mc6so417413lab.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Aug 2014 11:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=17lkVPTM4zJwGsfV9WK1zih+EpMXdwMjk8AbyVoB4XM=;
	b=rAiKizRAxtv40HHgChH0v4CjarsC5JuhsIs3oTzotCFa0bScl747Xby0FX63J9oA+K
	viuo6iHuOJS0X/j8j/3Fp1rglf2wwipkuQTtgFyiNnMXTYsaVY+cHL1Tjl1XtU+GrR49
	Dl3S7PrkKHNDOluYVlM+G3yIaAl5asUBzzNl5vWazW90XTbdNtuq8oXydtEush5nZ6cs
	PPcn8jifrYAxDvY6YNXuFIOVb0MUDk/Izu2F1IOiNEW/UmRbCMzh9EEHFjXHbr6KCnPJ
	Wclmt9mImp1dWHYm4i6a8zVyYHGA8onAuzQTyhvDvlSc5CgRgjTFOSmTr8zxZsLMwjY0
	ZhOQ==
MIME-Version: 1.0
X-Received: by 10.112.165.68 with SMTP id yw4mr35221524lbb.5.1409164736874;
	Wed, 27 Aug 2014 11:38:56 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Wed, 27 Aug 2014 11:38:56 -0700 (PDT)
In-Reply-To: <53FE2374.3030308@windriver.com>
References: <1409155567-13758-1-git-send-email-Zibo.Zhao@windriver.com>
	<CADkTA4MG3Xuhdj=GYfnOZR097bZv1sodEiSrStxE01uKKXGZTw@mail.gmail.com>
	<53FE2374.3030308@windriver.com>
Date: Wed, 27 Aug 2014 14:38:56 -0400
Message-ID: <CADkTA4O2TAK3HJF9FZdVNH0A-S1F3er+HPX-4aLFqKniJ4SexA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zibo Zhao <Zibo.Zhao@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/1] protobuf: fix ptest compile errors
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
X-List-Received-Date: Wed, 27 Aug 2014 18:39:05 -0000
Content-Type: text/plain; charset=UTF-8

I pushed the resolution already, but I'll take care of the fixup as well.

Thanks for checking.

Bruce

On Wed, Aug 27, 2014 at 2:29 PM, Zibo Zhao <Zibo.Zhao@windriver.com> wrote:
>
> On 08/27/2014 12:32 PM, Bruce Ashfield wrote:
>>
>> I had to resolve a reject on this one, so double check that your
>> meta-virt tree is
>> up to date, and also check that my resolution was correct.
>
> Sorry, Bruce. I certainly didn't pick up your latest commit regarding
> splitting the build/src directories.
> So the resolution has a little bit issue:
>
>
> sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i
> "${S}/${TEST_SRC_DIR}/protobuf.pc"
>
> Should have been using ${B} instead of ${S} since the file is in build dir
> not in source dir.
> Can you fix it or you want me to resubmit the patch?
>
> Zibo
>
>
>>
>> Cheers,
>>
>> Bruce
>>
>> On Wed, Aug 27, 2014 at 12:06 PM, Zibo Zhao <Zibo.Zhao@windriver.com>
>> wrote:
>>>
>>> While buiding protobuf ptest on Centos 6.4, the build
>>> failed with errors:
>>>
>>> ...libprotobuf.so: undefined reference to `memcpy@GLIBC_2.14'
>>>
>>> This is due to protobuf.pc still contains /usr/lib64
>>> as libdir which are not good for cross compiling.
>>> Replace it with proper sysroot path.
>>>
>>> Signed-off-by: Zibo Zhao <Zibo.Zhao@windriver.com>
>>> ---
>>>   recipes-containers/criu/protobuf_2.5.0.bb | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/recipes-containers/criu/protobuf_2.5.0.bb
>>> b/recipes-containers/criu/protobuf_2.5.0.bb
>>> index 5c7454b..c4b7d18 100644
>>> --- a/recipes-containers/criu/protobuf_2.5.0.bb
>>> +++ b/recipes-containers/criu/protobuf_2.5.0.bb
>>> @@ -37,6 +37,7 @@ do_compile_ptest() {
>>>          # Add the location of the cross-compiled header and library
>>> files
>>>          # which haven't been installed yet.
>>>          cp "${S}/protobuf.pc" "${S}/${TEST_SRC_DIR}/protobuf.pc"
>>> +       sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i
>>> "${S}/${TEST_SRC_DIR}/protobuf.pc"
>>>          sed -e 's|Cflags:|Cflags: -I${S}/src|' -i
>>> "${S}/${TEST_SRC_DIR}/protobuf.pc"
>>>          sed -e 's|Libs:|Libs: -L${S}/src/.libs|' -i
>>> "${S}/${TEST_SRC_DIR}/protobuf.pc"
>>>          export PKG_CONFIG_PATH="${S}/${TEST_SRC_DIR}"
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

