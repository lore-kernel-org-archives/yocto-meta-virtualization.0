Return-Path: <Zibo.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0F8CE007DB; Wed, 27 Aug 2014 11:29:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91D7BE007B9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Aug 2014 11:29:24 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7RITLmm029147
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Aug 2014 11:29:21 -0700 (PDT)
Received: from [128.224.56.210] (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 27 Aug 2014 11:29:21 -0700
Message-ID: <53FE2374.3030308@windriver.com>
Date: Wed, 27 Aug 2014 14:29:08 -0400
From: Zibo Zhao <Zibo.Zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1409155567-13758-1-git-send-email-Zibo.Zhao@windriver.com>
	<CADkTA4MG3Xuhdj=GYfnOZR097bZv1sodEiSrStxE01uKKXGZTw@mail.gmail.com>
In-Reply-To: <CADkTA4MG3Xuhdj=GYfnOZR097bZv1sodEiSrStxE01uKKXGZTw@mail.gmail.com>
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
X-List-Received-Date: Wed, 27 Aug 2014 18:29:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08/27/2014 12:32 PM, Bruce Ashfield wrote:
> I had to resolve a reject on this one, so double check that your
> meta-virt tree is
> up to date, and also check that my resolution was correct.
Sorry, Bruce. I certainly didn't pick up your latest commit regarding 
splitting the build/src directories.
So the resolution has a little bit issue:

sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i 
"${S}/${TEST_SRC_DIR}/protobuf.pc"

Should have been using ${B} instead of ${S} since the file is in build 
dir not in source dir.
Can you fix it or you want me to resubmit the patch?

Zibo

>
> Cheers,
>
> Bruce
>
> On Wed, Aug 27, 2014 at 12:06 PM, Zibo Zhao <Zibo.Zhao@windriver.com> wrote:
>> While buiding protobuf ptest on Centos 6.4, the build
>> failed with errors:
>>
>> ...libprotobuf.so: undefined reference to `memcpy@GLIBC_2.14'
>>
>> This is due to protobuf.pc still contains /usr/lib64
>> as libdir which are not good for cross compiling.
>> Replace it with proper sysroot path.
>>
>> Signed-off-by: Zibo Zhao <Zibo.Zhao@windriver.com>
>> ---
>>   recipes-containers/criu/protobuf_2.5.0.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/recipes-containers/criu/protobuf_2.5.0.bb b/recipes-containers/criu/protobuf_2.5.0.bb
>> index 5c7454b..c4b7d18 100644
>> --- a/recipes-containers/criu/protobuf_2.5.0.bb
>> +++ b/recipes-containers/criu/protobuf_2.5.0.bb
>> @@ -37,6 +37,7 @@ do_compile_ptest() {
>>          # Add the location of the cross-compiled header and library files
>>          # which haven't been installed yet.
>>          cp "${S}/protobuf.pc" "${S}/${TEST_SRC_DIR}/protobuf.pc"
>> +       sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${S}/${TEST_SRC_DIR}/protobuf.pc"
>>          sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${S}/${TEST_SRC_DIR}/protobuf.pc"
>>          sed -e 's|Libs:|Libs: -L${S}/src/.libs|' -i "${S}/${TEST_SRC_DIR}/protobuf.pc"
>>          export PKG_CONFIG_PATH="${S}/${TEST_SRC_DIR}"
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


