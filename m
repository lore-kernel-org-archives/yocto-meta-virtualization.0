Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 481AEE00CD0; Tue,  8 Sep 2015 07:12:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.178 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8ECEE00B66
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Sep 2015 07:12:51 -0700 (PDT)
Received: by ykdg206 with SMTP id g206so120085169ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Sep 2015 07:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cAFCxev0hLlhDhjeG8D4jhkkQuqC/vMA+whHz0a8mto=;
	b=YTb+MIFYfPosu2nwaDIpfPseUrWhb3Z0inIR3Pr2wuZxtQu8wwF23EToZv2+aGZ9CO
	ne0wS0xJQSP9nunX37fUyDBzb8xp567vh8MZ37Cl1H8zFGjXvnX3UmKyn7LuELZp0KPk
	lHInUptK+7xQaXziNumFnBOOdKn8Q1kCATTgwLYn4KffQVPvwy4pz+EqTCikA5r9o+C1
	rbDENSXWrXHmEPsbJg/e/eyUFZ1tyFRjK5TaiDKVYWtfdQPsD49S34WEbSJsDgbs34lP
	NlaE7b3QGiFn/eEGAM0YYB0EXfsIsnU6wP5W8AHDvlT7O3pwmPC/D4C6O0D270lSStQt
	b8pg==
MIME-Version: 1.0
X-Received: by 10.13.193.67 with SMTP id c64mr28528198ywd.68.1441721570024;
	Tue, 08 Sep 2015 07:12:50 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Tue, 8 Sep 2015 07:12:49 -0700 (PDT)
In-Reply-To: <CADkTA4MZp_wp1rxiWbaouH--7NwtLKjN6GFiYV=UwMGG4Thr1w@mail.gmail.com>
References: <1441379737-16799-1-git-send-email-josep.puigdemont@enea.com>
	<CADkTA4MZp_wp1rxiWbaouH--7NwtLKjN6GFiYV=UwMGG4Thr1w@mail.gmail.com>
Date: Tue, 8 Sep 2015 10:12:49 -0400
Message-ID: <CADkTA4On=Sm2Z8X0C2Qtk+GP6fwTOCY=CkGvdG4EEt4cc3dw1g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][kilo][PATCH 1/2] python-sqlparse: add recipe
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
X-List-Received-Date: Tue, 08 Sep 2015 14:12:53 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 8, 2015 at 10:12 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> merged to fido

s/fido/kilo/

Bruce

>
> Bruce
>
> On Fri, Sep 4, 2015 at 11:15 AM, Josep Puigdemont
> <josep.puigdemont@enea.com> wrote:
>> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
>> ---
>>  .../recipes-devtools/python/python-sqlparse_0.1.16.bb       | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>  create mode 100644 meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
>>
>> diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb b/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
>> new file mode 100644
>> index 0000000..acfc3cb
>> --- /dev/null
>> +++ b/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
>> @@ -0,0 +1,13 @@
>> +DESCRIPTION = "sqlparse is a non-validating SQL parser module."
>> +HOMEPAGE = "https://github.com/andialbrecht/sqlparse"
>> +SECTION = "devel/python"
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=13ec2f893997ca1f516b55496e019a81"
>> +
>> +SRC_URI[md5sum] = "370962a307ebaaa70a28b6b0ccb53980"
>> +SRC_URI[sha256sum] = "678c6c36ca4b01405177da8b84eecf92ec92c9f6c762396c965bb5d305f20f81"
>> +
>> +export BUILD_SYS
>> +export HOST_SYS
>> +
>> +inherit pypi
>> --
>> 2.1.0
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

