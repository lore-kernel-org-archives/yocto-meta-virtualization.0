Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 478A3E00DE3; Tue,  5 Nov 2019 18:27:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1409E00D00
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Nov 2019 18:27:40 -0800 (PST)
Received: by mail-ed1-f65.google.com with SMTP id p59so17983048edp.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Nov 2019 18:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rbRunXDPpnu4h1gMrkxj78Kn6cEYs96H9QrempEWzBA=;
	b=C/HgH8KAY8IA3QBJODB2XQB2GAgejnOCIU/KjpD6xwbOgUYxbw9fcs2JMaYrABFrel
	SKigME10kOJqhXyXHhLbierVAET/f7OAlogrPGZq7w8AQkhvLBVUeJm5mmXUCHOViLtE
	B29rRU94sajejHNBKnWG7UmssY07qpUh5DZIYaG9eubHi93IgvTIGOl80lyQIORrCJSh
	OqjKorQoelmftto3ZM8+fB3YOAistiuhOzDJs8CjYKO5saDSNxW3JuX6O3wQdhbMbNqR
	QN4wWDVCiWndB0GOhITIoL0KW36aNgmmsg8UDA0c5C0cKP844Q/8AYo3qVt21aQG6yV8
	/2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rbRunXDPpnu4h1gMrkxj78Kn6cEYs96H9QrempEWzBA=;
	b=BDJlUmE+0Vp2EjnGNjH5/pmq2R6VmM1Au0GlRZnfz6C74CDvREziWrbsMHFHb3pIpW
	zfLZ8Py6EQ6FG4WFwToNXV2z2m5Cmw8/cAcgPGHpHGWkiZRyCGpaiTtUJZ0wO0tmIIK2
	fYBJR0q+3v0oNrj8MHA464DyDvD8LQLspfBQqAnMEMUn73+OELJZ+VdqgfnU6N/1XNxZ
	QdvhlBQP0qLikKhMkmH0I5LRplcQzlqs5wd9IS0sNLYLYTJOis86HqV+ClhPxpV11cgY
	5SkZP1wVKN1CeiFiSLLGhxab1LiTRccVQoOBPIBZvtAl3QxRpBiF+CJ8WB1WKABy2666
	jVtA==
X-Gm-Message-State: APjAAAVypMWMktyoAkAvhgaNpNOmrHbTVdPL3Bw/j/lIJAAL06v3MqyU
	rNK+6illGHeF3zUocqfBnvDsySj2co1W0OM8d5M=
X-Google-Smtp-Source: APXvYqysW85nyhFiZgL/6BVOvi6wVsN3YkiANWvmtw83V9Y358KUxZBAI4FrongcWQ3sw/pivz/VYtcMPEKcUFqYhCM=
X-Received: by 2002:a50:870c:: with SMTP id i12mr130871edb.16.1573007259573;
	Tue, 05 Nov 2019 18:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20191030082705.11361-1-Qi.Chen@windriver.com>
In-Reply-To: <20191030082705.11361-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 5 Nov 2019 21:27:28 -0500
Message-ID: <CADkTA4OONtp9FKua_1H81qAfbMY1aRUzFPNVf7QRKPkc35m_wA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] runc: fix CVE-2019-16884
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
X-List-Received-Date: Wed, 06 Nov 2019 02:27:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 30, 2019 at 4:27 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...nly-allow-proc-mount-if-it-is-procfs.patch | 201 ++++++++++++++++++
>  recipes-containers/runc/runc-docker_git.bb    |   1 +
>  2 files changed, 202 insertions(+)
>  create mode 100644 recipes-containers/runc/files/0001-Only-allow-proc-mount-if-it-is-procfs.patch
>
> diff --git a/recipes-containers/runc/files/0001-Only-allow-proc-mount-if-it-is-procfs.patch b/recipes-containers/runc/files/0001-Only-allow-proc-mount-if-it-is-procfs.patch
> new file mode 100644
> index 0000000..5aca99e
> --- /dev/null
> +++ b/recipes-containers/runc/files/0001-Only-allow-proc-mount-if-it-is-procfs.patch
> @@ -0,0 +1,201 @@
> +From d75b05441772417a0828465a9483f16287937724 Mon Sep 17 00:00:00 2001
> +From: Michael Crosby <crosbymichael@gmail.com>
> +Date: Mon, 23 Sep 2019 16:45:45 -0400
> +Subject: [PATCH] Only allow proc mount if it is procfs
> +
> +Fixes #2128
> +
> +This allows proc to be bind mounted for host and rootless namespace usecases but
> +it removes the ability to mount over the top of proc with a directory.
> +
> +```bash
> +> sudo docker run --rm  apparmor
> +docker: Error response from daemon: OCI runtime create failed:
> +container_linux.go:346: starting container process caused "process_linux.go:449:
> +container init caused \"rootfs_linux.go:58: mounting
> +\\\"/var/lib/docker/volumes/aae28ea068c33d60e64d1a75916cf3ec2dc3634f97571854c9ed30c8401460c1/_data\\\"
> +to rootfs
> +\\\"/var/lib/docker/overlay2/a6be5ae911bf19f8eecb23a295dec85be9a8ee8da66e9fb55b47c841d1e381b7/merged\\\"
> +at \\\"/proc\\\" caused
> +\\\"\\\\\\\"/var/lib/docker/overlay2/a6be5ae911bf19f8eecb23a295dec85be9a8ee8da66e9fb55b47c841d1e381b7/merged/proc\\\\\\\"
> +cannot be mounted because it is not of type proc\\\"\"": unknown.
> +
> +> sudo docker run --rm -v /proc:/proc apparmor
> +
> +docker-default (enforce)        root     18989  0.9  0.0   1288     4 ?
> +Ss   16:47   0:00 sleep 20
> +```
> +
> +Signed-off-by: Michael Crosby <crosbymichael@gmail.com>
> +
> +Upstream-Status: Backport [https://github.com/opencontainers/runc/pull/2129/commits/331692baa7afdf6c186f8667cb0e6362ea0802b3]
> +
> +CVE: CVE-2019-16884
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + libcontainer/container_linux.go   |  4 +--
> + libcontainer/rootfs_linux.go      | 50 +++++++++++++++++++++++--------
> + libcontainer/rootfs_linux_test.go |  8 ++---
> + 3 files changed, 43 insertions(+), 19 deletions(-)
> +
> +diff --git a/libcontainer/container_linux.go b/libcontainer/container_linux.go
> +index 7e58e5e0..d51e35df 100644
> +--- a/src/import/libcontainer/container_linux.go
> ++++ b/src/import/libcontainer/container_linux.go
> +@@ -19,7 +19,7 @@ import (
> +       "syscall" // only for SysProcAttr and Signal
> +       "time"
> +
> +-      "github.com/cyphar/filepath-securejoin"
> ++      securejoin "github.com/cyphar/filepath-securejoin"
> +       "github.com/opencontainers/runc/libcontainer/cgroups"
> +       "github.com/opencontainers/runc/libcontainer/configs"
> +       "github.com/opencontainers/runc/libcontainer/intelrdt"
> +@@ -1160,7 +1160,7 @@ func (c *linuxContainer) makeCriuRestoreMountpoints(m *configs.Mount) error {
> +               if err != nil {
> +                       return err
> +               }
> +-              if err := checkMountDestination(c.config.Rootfs, dest); err != nil {
> ++              if err := checkProcMount(c.config.Rootfs, dest, ""); err != nil {
> +                       return err
> +               }
> +               m.Destination = dest
> +diff --git a/libcontainer/rootfs_linux.go b/libcontainer/rootfs_linux.go
> +index f13b226e..5650b0ac 100644
> +--- a/src/import/libcontainer/rootfs_linux.go
> ++++ b/src/import/libcontainer/rootfs_linux.go
> +@@ -13,7 +13,7 @@ import (
> +       "strings"
> +       "time"
> +
> +-      "github.com/cyphar/filepath-securejoin"
> ++      securejoin "github.com/cyphar/filepath-securejoin"
> +       "github.com/mrunalp/fileutils"
> +       "github.com/opencontainers/runc/libcontainer/cgroups"
> +       "github.com/opencontainers/runc/libcontainer/configs"
> +@@ -197,7 +197,7 @@ func prepareBindMount(m *configs.Mount, rootfs string) error {
> +       if dest, err = securejoin.SecureJoin(rootfs, m.Destination); err != nil {
> +               return err
> +       }
> +-      if err := checkMountDestination(rootfs, dest); err != nil {
> ++      if err := checkProcMount(rootfs, dest, m.Source); err != nil {
> +               return err
> +       }
> +       // update the mount with the correct dest after symlinks are resolved.
> +@@ -388,7 +388,7 @@ func mountToRootfs(m *configs.Mount, rootfs, mountLabel string, enableCgroupns b
> +               if dest, err = securejoin.SecureJoin(rootfs, m.Destination); err != nil {
> +                       return err
> +               }
> +-              if err := checkMountDestination(rootfs, dest); err != nil {
> ++              if err := checkProcMount(rootfs, dest, m.Source); err != nil {
> +                       return err
> +               }
> +               // update the mount with the correct dest after symlinks are resolved.
> +@@ -435,12 +435,12 @@ func getCgroupMounts(m *configs.Mount) ([]*configs.Mount, error) {
> +       return binds, nil
> + }
> +
> +-// checkMountDestination checks to ensure that the mount destination is not over the top of /proc.
> ++// checkProcMount checks to ensure that the mount destination is not over the top of /proc.
> + // dest is required to be an abs path and have any symlinks resolved before calling this function.
> +-func checkMountDestination(rootfs, dest string) error {
> +-      invalidDestinations := []string{
> +-              "/proc",
> +-      }
> ++//
> ++// if source is nil, don't stat the filesystem.  This is used for restore of a checkpoint.
> ++func checkProcMount(rootfs, dest, source string) error {
> ++      const procPath = "/proc"
> +       // White list, it should be sub directories of invalid destinations
> +       validDestinations := []string{
> +               // These entries can be bind mounted by files emulated by fuse,
> +@@ -463,16 +463,40 @@ func checkMountDestination(rootfs, dest string) error {
> +                       return nil
> +               }
> +       }
> +-      for _, invalid := range invalidDestinations {
> +-              path, err := filepath.Rel(filepath.Join(rootfs, invalid), dest)
> ++      path, err := filepath.Rel(filepath.Join(rootfs, procPath), dest)
> ++      if err != nil {
> ++              return err
> ++      }
> ++      // pass if the mount path is located outside of /proc
> ++      if strings.HasPrefix(path, "..") {
> ++              return nil
> ++      }
> ++      if path == "." {
> ++              // an empty source is pasted on restore
> ++              if source == "" {
> ++                      return nil
> ++              }
> ++              // only allow a mount on-top of proc if it's source is "proc"
> ++              isproc, err := isProc(source)
> +               if err != nil {
> +                       return err
> +               }
> +-              if path != "." && !strings.HasPrefix(path, "..") {
> +-                      return fmt.Errorf("%q cannot be mounted because it is located inside %q", dest, invalid)
> ++              // pass if the mount is happening on top of /proc and the source of
> ++              // the mount is a proc filesystem
> ++              if isproc {
> ++                      return nil
> +               }
> ++              return fmt.Errorf("%q cannot be mounted because it is not of type proc", dest)
> +       }
> +-      return nil
> ++      return fmt.Errorf("%q cannot be mounted because it is inside /proc", dest)
> ++}
> ++
> ++func isProc(path string) (bool, error) {
> ++      var s unix.Statfs_t
> ++      if err := unix.Statfs(path, &s); err != nil {
> ++              return false, err
> ++      }
> ++      return s.Type == unix.PROC_SUPER_MAGIC, nil
> + }
> +
> + func setupDevSymlinks(rootfs string) error {
> +diff --git a/libcontainer/rootfs_linux_test.go b/libcontainer/rootfs_linux_test.go
> +index d755984b..1bfe7c66 100644
> +--- a/src/import/libcontainer/rootfs_linux_test.go
> ++++ b/src/import/libcontainer/rootfs_linux_test.go
> +@@ -10,7 +10,7 @@ import (
> +
> + func TestCheckMountDestOnProc(t *testing.T) {
> +       dest := "/rootfs/proc/sys"
> +-      err := checkMountDestination("/rootfs", dest)
> ++      err := checkProcMount("/rootfs", dest, "")
> +       if err == nil {
> +               t.Fatal("destination inside proc should return an error")
> +       }
> +@@ -18,7 +18,7 @@ func TestCheckMountDestOnProc(t *testing.T) {
> +
> + func TestCheckMountDestOnProcChroot(t *testing.T) {
> +       dest := "/rootfs/proc/"
> +-      err := checkMountDestination("/rootfs", dest)
> ++      err := checkProcMount("/rootfs", dest, "/proc")
> +       if err != nil {
> +               t.Fatal("destination inside proc when using chroot should not return an error")
> +       }
> +@@ -26,7 +26,7 @@ func TestCheckMountDestOnProcChroot(t *testing.T) {
> +
> + func TestCheckMountDestInSys(t *testing.T) {
> +       dest := "/rootfs//sys/fs/cgroup"
> +-      err := checkMountDestination("/rootfs", dest)
> ++      err := checkProcMount("/rootfs", dest, "")
> +       if err != nil {
> +               t.Fatal("destination inside /sys should not return an error")
> +       }
> +@@ -34,7 +34,7 @@ func TestCheckMountDestInSys(t *testing.T) {
> +
> + func TestCheckMountDestFalsePositive(t *testing.T) {
> +       dest := "/rootfs/sysfiles/fs/cgroup"
> +-      err := checkMountDestination("/rootfs", dest)
> ++      err := checkProcMount("/rootfs", dest, "")
> +       if err != nil {
> +               t.Fatal(err)
> +       }
> +--
> +2.17.1
> +
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
> index c9f460b..8d810d0 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -7,6 +7,7 @@ SRC_URI = "git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
>             file://0001-runc-Add-console-socket-dev-null.patch \
>             file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
>             file://0001-runc-docker-SIGUSR1-daemonize.patch \
> +           file://0001-Only-allow-proc-mount-if-it-is-procfs.patch \
>            "

Sorry for the slow reply, I was traveling and didn't have a lot of time.

Is this only on the runc-docker side ? or is the runc-opencontainers
also vulnerable ?

Bruce

>
>  RUNC_VERSION = "1.0.0-rc8"
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

