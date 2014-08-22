Return-Path: <Keith.Holman@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88E9BE0084D; Fri, 22 Aug 2014 11:56:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43F45E00781
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Aug 2014 11:56:38 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7MIuZdX019433
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Aug 2014 11:56:35 -0700 (PDT)
Received: from [128.224.56.110] (128.224.56.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 22 Aug 2014 11:56:34 -0700
Message-ID: <53F79262.80000@windriver.com>
Date: Fri, 22 Aug 2014 14:56:34 -0400
From: Keith Holman <Keith.Holman@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1408567571-27481-1-git-send-email-Keith.Holman@windriver.com>
	<CADkTA4N6+5NQs=mUQK+CB-vuCmvezHO1vdcZ_6Ob4xr00qyOUA@mail.gmail.com>
In-Reply-To: <CADkTA4N6+5NQs=mUQK+CB-vuCmvezHO1vdcZ_6Ob4xr00qyOUA@mail.gmail.com>
X-Originating-IP: [128.224.56.110]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/5] protobuf: update google protocol buffers to 2.5.0
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
X-List-Received-Date: Fri, 22 Aug 2014 18:56:44 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 22/08/14 02:52 PM, Bruce Ashfield wrote:
> Keith,
>
> My build test is showing this:
>
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_compile_ptest_base (log file is located at
> /home/bruce/poky/build/tmp/work/core2-64-poky-linux/protobuf/2.5.0-r0/temp/log.do_compile_ptest_base.30471)
> ERROR: Logfile of failure stored in:
> /home/bruce/poky/build/tmp/work/core2-64-poky-linux/protobuf/2.5.0-r0/temp/log.do_compile_ptest_base.30471
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> 'bit-64', 'x86_64-linux', 'common']
> | DEBUG: Executing shell function do_compile_ptest_base
> | cp: cannot stat
> '/home/bruce/poky/build/tmp/work/core2-64-poky-linux/protobuf/2.5.0-r0/protobuf-2.5.0/protobuf.pc':
> No such file or directory
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile_ptest_base (log file is located
> at /home/bruce/poky/build/tmp/work/core2-64-poky-linux/protobuf/2.5.0-r0/temp/log.do_compile_ptest_base.30471)
> ERROR: Task 9 (/home/bruce/poky/meta-virtualization/recipes-containers/criu/protobuf_2.5.0.bb,
> do_compile_ptest_base) failed with exit code '1'
>
> Does that look familiar ?

No, I never got that.  The "protobuf.pc" file should be generated from 
the do_compile() command.  I wouldn't know why it doesn't generate the 
file.  Its required to be used by the pkgcfg command in the Makefile in 
the examples directory.  It contains the location of the compiler flags 
and library flags for the compiler being used on the system. The script 
makes a temporary copy of this file into the "examples" directory and 
modifies it to cross-compile the examples for the target machine.

- Keith

>
> Bruce
>
>
> On Wed, Aug 20, 2014 at 4:46 PM, Keith Holman
> <Keith.Holman@windriver.com> wrote:
>> Upgrade Google Protocol Buffers to version 2.5.0.  The previous
>> version 2.4.1 is getting quite old (released April 2011).  The newer
>> version provides bug fixes and more functionality.  This version adds
>> some speed optimization and the ability to allow multiple enum
>> symbols to have the same value.
>>
>> Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
>> ---
>>   recipes-containers/criu/protobuf_2.4.1.bb | 18 ------------------
>>   recipes-containers/criu/protobuf_2.5.0.bb | 20 ++++++++++++++++++++
>>   2 files changed, 20 insertions(+), 18 deletions(-)
>>   delete mode 100644 recipes-containers/criu/protobuf_2.4.1.bb
>>   create mode 100644 recipes-containers/criu/protobuf_2.5.0.bb
>>
>> diff --git a/recipes-containers/criu/protobuf_2.4.1.bb b/recipes-containers/criu/protobuf_2.4.1.bb
>> deleted file mode 100644
>> index d8f1b53..0000000
>> --- a/recipes-containers/criu/protobuf_2.4.1.bb
>> +++ /dev/null
>> @@ -1,18 +0,0 @@
>> -SUMMARY = "protobuf"
>> -DESCRIPTION = "Protocol Buffers are a way of encoding structured data in an efficient yet extensible format. Google uses Protocol Buffers for almost all of its internal RPC protocols and file formats."
>> -HOMEPAGE = "http://code.google.com/p/protobuf/"
>> -SECTION = "console/tools"
>> -LICENSE = "BSD-3-Clause"
>> -
>> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
>> -
>> -PR = "r0"
>> -
>> -SRC_URI[md5sum] = "dc84e9912ea768baa1976cb7bbcea7b5"
>> -SRC_URI[sha256sum] = "eac6969b617f397247e805267da2b0db3ff9e5a9163b123503a192fbb5776567"
>> -SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz"
>> -
>> -EXTRA_OECONF += " --with-protoc=echo"
>> -inherit autotools
>> -
>> -BBCLASSEXTEND = "native nativesdk"
>> \ No newline at end of file
>> diff --git a/recipes-containers/criu/protobuf_2.5.0.bb b/recipes-containers/criu/protobuf_2.5.0.bb
>> new file mode 100644
>> index 0000000..4a90b2c
>> --- /dev/null
>> +++ b/recipes-containers/criu/protobuf_2.5.0.bb
>> @@ -0,0 +1,20 @@
>> +SUMMARY = "protobuf"
>> +DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
>> +an efficient yet extensible format. Google uses Protocol Buffers for \
>> +almost all of its internal RPC protocols and file formats."
>> +HOMEPAGE = "http://code.google.com/p/protobuf/"
>> +SECTION = "console/tools"
>> +LICENSE = "BSD-3-Clause"
>> +
>> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
>> +
>> +PR = "r0"
>> +
>> +SRC_URI[md5sum] = "b751f772bdeb2812a2a8e7202bf1dae8"
>> +SRC_URI[sha256sum] = "c55aa3dc538e6fd5eaf732f4eb6b98bdcb7cedb5b91d3b5bdcf29c98c293f58e"
>> +SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz"
>> +
>> +EXTRA_OECONF += " --with-protoc=echo"
>> +inherit autotools
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 1.9.3
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>

