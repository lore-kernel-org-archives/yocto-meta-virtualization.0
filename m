Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3DB2E00955; Tue, 17 Jan 2017 12:55:53 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1EC7AE00947
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 12:55:52 -0800 (PST)
Received: by mail-yw0-f195.google.com with SMTP id l75so12978767ywb.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 12:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sem5J2BjAcwjc5dH85Qreua+1rbH4jIeKqRWX2NWEDM=;
	b=c6wqtAfYd8sKF3W7tO7PDiNuLPvpHqF3ERjlqYfmMCn6FE8YuptXmPtnMAgcO84iP7
	8OyNN7l18FP+P1eFYlKOo2iZguPQHv+LXG3neMjsnVFBK92yQGeKR/gNvgyLXG1mZux3
	qFqzS/OC9HtXPB77dcRXUrBfIBCvkhffP1jg/QjpyKUyL7hAD0QYxopXd082IlX2D8bb
	3AMbcLX58wC1NADvNyFY1DR64v7uSzM5u8jWdoN/bEhAZudG06xrBY5voDLFlLyUo4lR
	cYWj05k398QO8MmR/REm7qZET+lt+eSFdBMpgOCtkHzn2XrNewh6e3LmDuodlhd4L3ux
	d0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=sem5J2BjAcwjc5dH85Qreua+1rbH4jIeKqRWX2NWEDM=;
	b=R3Yr379/pdXZ3KjXs3AN7JahikvVkjMRAf2lAt9ZgL+48gxDlH8KcYPibL72UizB1e
	j+dhRPzjrHJ5OJXjF6PTPXeUqFEacYiPhbpRRdj4ex9/NXjQzKtcD5M47n4dZw49MXbA
	yOT4qokSvQ/1O2UuS5ecWeTkulyF887CzGOzhzj3/Z4I2Ikqe4heiIajlfRhVHyc88bh
	x3D1kugRkJgjn1reElpllw93uMzOIij6di0Te6LmjbpBsCb+uzFL6STlX5heISvelMeB
	4u7OcUQwVZddCi5rBVeYOnH/4a5ObzFCskmz1gud94QoEaWRenwu4iOBYkoCV6Zfw1kB
	H6Yg==
X-Gm-Message-State: AIkVDXKAAGc6n8l4Z5toUtBIeVnPIIOfiUKE652cavt//bqoGUQeeG78SnmQnNVrKKGxvdeRFK6hDbaGPJiONg==
X-Received: by 10.129.174.3 with SMTP id m3mr8721358ywh.152.1484686551875;
	Tue, 17 Jan 2017 12:55:51 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.99 with HTTP; Tue, 17 Jan 2017 12:55:51 -0800 (PST)
In-Reply-To: <CADkTA4PSg5kfWJgjYfk5reLfGXgUDuoxuijHZq8SQc0bYCivcA@mail.gmail.com>
References: <1484531499-24440-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CADkTA4PSg5kfWJgjYfk5reLfGXgUDuoxuijHZq8SQc0bYCivcA@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 17 Jan 2017 15:55:51 -0500
X-Google-Sender-Auth: tQvC-tqtKIBlPcrWaqM8d0jNQcM
Message-ID: <CAPuovELe3f-6Co=cz54oniX2i4+E_DbTHhhD=z_Knc2TXbQXHw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-sqlalchemy: 1.0.8 -> 1.0.9
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
X-List-Received-Date: Tue, 17 Jan 2017 20:55:54 -0000
Content-Type: text/plain; charset=UTF-8

Huang I didn't see any indication in the commit log related to why you
stopped at 1.0.9 and didn't continue to take this to 1.0.16. Is there
a reason you selected this version? I would like to take it to 1.0.16
to pick up the remaining bug fixes as well as support the uprev to
OpenStack Newton in meta-cloud-services. python-oslo.db in
stable/newton requires 1.0.10 at minimum. Please let me know.

Mark

On Tue, Jan 17, 2017 at 2:50 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> merged.
>
> Bruce
>
> On Sun, Jan 15, 2017 at 8:51 PM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> wrote:
>>
>> Upgrade python-sqlalchemy from 1.0.8 to 1.0.9.
>>
>> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>> ---
>>  .../python/{python-sqlalchemy_1.0.8.bb => python-sqlalchemy_1.0.9.bb} | 4
>> ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename recipes-devtools/python/{python-sqlalchemy_1.0.8.bb =>
>> python-sqlalchemy_1.0.9.bb} (76%)
>>
>> diff --git a/recipes-devtools/python/python-sqlalchemy_1.0.8.bb
>> b/recipes-devtools/python/python-sqlalchemy_1.0.9.bb
>> similarity index 76%
>> rename from recipes-devtools/python/python-sqlalchemy_1.0.8.bb
>> rename to recipes-devtools/python/python-sqlalchemy_1.0.9.bb
>> index 2d66ffd..01c94a5 100644
>> --- a/recipes-devtools/python/python-sqlalchemy_1.0.8.bb
>> +++ b/recipes-devtools/python/python-sqlalchemy_1.0.9.bb
>> @@ -8,8 +8,8 @@ RDEPENDS_${PN} += "python-numbers"
>>  SRCNAME = "SQLAlchemy"
>>  SRC_URI =
>> "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>>
>> -SRC_URI[md5sum] = "7cfd005be63945c96a78c67764ac3a85"
>> -SRC_URI[sha256sum] =
>> "950c79c0abf9e9f99c43c627c51d40d14a946810a90c35e7cd827bfd0bffe46f"
>> +SRC_URI[md5sum] = "0e2d7442e70d02c9f6346a5bf0ec2265"
>> +SRC_URI[sha256sum] =
>> "c3d37501e36ec5d74c2d7b4a3764719db86a9cdab4a24431bf58b386743ab10e"
>>
>>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>>
>> --
>> 2.7.4
>>
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

