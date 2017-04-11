Return-Path: <Muhammad_Sheheryar@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35B72E00AF0; Mon, 10 Apr 2017 23:55:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [192.94.38.131 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8E85E00A9B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Apr 2017 23:55:30 -0700 (PDT)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cxpi5-00024z-Al from Muhammad_Sheheryar@mentor.com ;
	Mon, 10 Apr 2017 23:55:29 -0700
Received: from svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) by
	svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Tue, 11 Apr 2017 07:55:26 +0100
Received: from svr-ies-mbx-01.mgc.mentorg.com ([fe80::15aa:fe76:2483:1cce]) by
	svr-ies-mbx-01.mgc.mentorg.com ([fe80::15aa:fe76:2483:1cce%22]) with
	mapi id 15.00.1210.000; Tue, 11 Apr 2017 07:55:26 +0100
From: "Sheheryar, Muhammad" <Muhammad_Sheheryar@mentor.com>
To: "mark.asselstine@windriver.com" <mark.asselstine@windriver.com>
Thread-Topic: [meta-virtualization] Errors in building docker
Thread-Index: AQHSsd+l9g3VElpJGUqaKT/9Ruj6z6G+508AgADUH5c=
Date: Tue, 11 Apr 2017 06:55:26 +0000
Message-ID: <1491893726200.31080@mentor.com>
References: <1491817865525.65707@mentor.com>,
	<CAPuovE+3a2OFr+4Dzo1Z4ox+S1tjEOw4Kkq4J_UTbyZm7L+SuQ@mail.gmail.com>
In-Reply-To: <CAPuovE+3a2OFr+4Dzo1Z4ox+S1tjEOw4Kkq4J_UTbyZm7L+SuQ@mail.gmail.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Errors in building docker
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
X-List-Received-Date: Tue, 11 Apr 2017 06:55:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Mark,=0A=
=0A=
The file command show the following output=0A=
=0A=
libsqlite3.so: symbolic link to libsqlite3.so.0.8.6=0A=
=0A=
Due to some reason, I think it is related to the go-net and go-sqlite packa=
ges that are required by docker in the fido branch. The fetchers for these =
packages fail because their repositories are removed, and I cannot find the=
 required versions anywhere. In the later branches, they have added the sup=
port of these packages in the core of go-cross, so they do not need to be f=
etched separately. Do you think I can back port it to the fido branch, give=
n that there is no go-cross in it???=0A=
=0A=
Regards,=0A=
=0A=
Muhammad Sheheryar Qureshi =0A=
________________________________________=0A=
From: asselsm@gmail.com <asselsm@gmail.com> on behalf of Mark Asselstine <m=
ark.asselstine@windriver.com>=0A=
Sent: Tuesday, April 11, 2017 12:09 AM=0A=
To: Sheheryar, Muhammad=0A=
Cc: meta-virtualization@yoctoproject.org=0A=
Subject: Re: [meta-virtualization] Errors in building docker=0A=
=0A=
On Mon, Apr 10, 2017 at 5:51 AM, Sheheryar, Muhammad=0A=
<Muhammad_Sheheryar@mentor.com> wrote:=0A=
> Hi,=0A=
>=0A=
>=0A=
> I am trying to build docker in my yocto project (fido branch). I am=0A=
> encountering the following errors=0A=
>=0A=
>=0A=
> Log data follows:=0A=
> | DEBUG: Executing shell function do_compile=0A=
> |=0A=
> /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar_containe=
rs/yocto/fido/build/mf0200/tmp-glibc/work/cortexa9hf-vfp-neon-oe-linux-gnue=
abi/docker/1.5.0+git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/git=0A=
> | # WARNING! I don't seem to be running in the Docker container.=0A=
> | # The result of this command might be an incorrect build, and will not =
be=0A=
> | #   officially supported.=0A=
> | #=0A=
> | # Try this instead: make all=0A=
> | #=0A=
> |=0A=
> | bundles/1.5.0-dev already exists. Removing.=0A=
> |=0A=
> | ---> Making bundle: dynbinary (in bundles/1.5.0-dev/dynbinary)=0A=
> | Created binary:=0A=
> /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar_containe=
rs/yocto/fido/build/mf0200/tmp-glibc/work/cortexa9hf-vfp-neon-oe-linux-gnue=
abi/docker/1.5.0+git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/git/bundles=
/1.5.0-dev/dynbinary/dockerinit-1.5.0-dev=0A=
> | # code.google.com/p/gosqlite/sqlite3=0A=
> |=0A=
> /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar_containe=
rs/yocto/fido/build/mf0200/tmp-glibc/sysroots/x86_64-linux/usr/lib/libsqlit=
e3.so:=0A=
> file not recognized: File format not recognized=0A=
=0A=
Have you run the 'file' command on this file to determine what it is=0A=
being seen as? Most likely an ARCH mismatch which you can then work=0A=
backwards from to determine what is creating this scenario.=0A=
=0A=
Mark=0A=
=0A=
=0A=
> | collect2: error: ld returned 1 exit status=0A=
> | WARNING:=0A=
> /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar_containe=
rs/yocto/fido/build/mf0200/tmp-glibc/work/cortexa9hf-vfp-neon-oe-linux-gnue=
abi/docker/1.5.0+git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/temp/run.do=
_compile.32468:1=0A=
> exit 1 from=0A=
> |   DOCKER_GITCOMMIT=3D"2243e32cbbf1c9809c262a7376d34ca43a7a36dc"=0A=
> ./hack/make.sh dynbinary=0A=
> | ERROR: Function failed: do_compile (log file is located at=0A=
> /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar_containe=
rs/yocto/fido/build/mf0200/tmp-glibc/work/cortexa9hf-vfp-neon-oe-linux-gnue=
abi/docker/1.5.0+git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/temp/log.do=
_compile.32468)=0A=
>=0A=
>=0A=
> My instinct is that the errors are somehow related to go-sqlite package=
=0A=
> required for docker. The fetcher for the package fails as its previous=0A=
> repository has been shifted or removed. Can someone help me out?=0A=
>=0A=
>=0A=
> Regards,=0A=
>=0A=
>=0A=
> Muhammad Sheheryar=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>=0A=
> --=0A=
> _______________________________________________=0A=
> meta-virtualization mailing list=0A=
> meta-virtualization@yoctoproject.org=0A=
> https://lists.yoctoproject.org/listinfo/meta-virtualization=0A=
>=0A=

