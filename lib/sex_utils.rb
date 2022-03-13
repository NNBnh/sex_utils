# frozen_string_literal: true

require "fileutils"
require_relative "sex_utils/version"

module SexUtils
  class Error < StandardError; end


  @selection = []
  
  def s(paths)
    @selection = Array(paths).flatten.map { |path| File.realpath path }
  end
  
  
  def cmp(a, b)
    a ||= @selection[0] if @selection.one?
  
    unless b
      print "Compare to: "
      b ||= gets # TODO
    end
  
    FileUtils.compare_file a, b
  end
  
  
  def copy_entry(
    src, dest, preserve = false, dereference_root = false,
    remove_destination = false
  )
    unless src
      scr = @selection
      dest = Dir.pwd
    elsif Array(src).one?
      print "Copy to: "
      dest ||= gets # TODO
    end
  
    FileUtils.copy_entry(
      src, dest, preserve = preserve, dereference_root = dereference_root,
      remove_destination = remove_destination
    )
  end
  
  def copy_file(src, dest, preserve = false, dereference = true)
    unless src
      scr = @selection
      dest = Dir.pwd
    elsif Array(src).one?
      print "Copy to: "
      dest ||= gets # TODO
    end
  
    FileUtils.copy_file src, dest, preserve = preserve, dereference = dereference
  end
  
  
  def cp(src, dest, preserve: nil, noop: nil, verbose: nil)
    unless src
      scr = @selection
      dest = Dir.pwd
    elsif Array(src).one?
      print "Copy to: "
      dest ||= gets # TODO
    end
  
    FileUtils.cp src, dest, preserve: preserv, noop: noop, verbose: verbose
  end
  
  def cp_r(
    src, dest, preserve: nil, noop: nil, verbose: nil,
    dereference_root: true, remove_destination: nil
  )
    unless src
      scr = @selection
      dest = Dir.pwd
    elsif Array(src).one?
      print "Copy to: "
      dest ||= gets # TODO
    end
  
    FileUtils.cp_r(
      src, dest, preserve: preserv, noop: noop, verbose: verbose,
      dereference_root: dereference_root,  remove_destination: remove_destination
    )
  end
  
  
  def mv(src, dest, force: nil, noop: nil, verbose: nil, secure: nil)
    unless src
      scr = @selection
      dest = Dir.pwd
    elsif Array(src).one?
      print "Move to: "
      dest ||= gets # TODO
    end
  
    @selection = FileUtils.mv(
      src, dest, force: force, noop: noop, verbose: verbose, secure: secure
    )
  end
  
  
  def link_entry(src, dest, dereference_root = false, remove_destination = false)
    unless src
      scr = @selection
      dest = Dir.pwd
    elsif Array(src).one?
      print "Move to: "
      dest ||= gets # TODO
    end
  
    FileUtils.link_entry(
      src, dest, dereference_root = dereference_root,
      remove_destination = remove_destination
    )
  end
  
  
  def ln(targets, link, force: nil, noop: nil, verbose: nil)
    unless targets
      targets = @selection
      link = Dir.pwd
    elsif Array(src).one?
      print "Link from: "
      link ||= gets # TODO
    end
  
    FileUtils.ln targets, link, force: force, noop: noop, verbose: verbose
  end
  
  def ln_s(targets, dir, force: nil, noop: nil, verbose: nil)
    unless targets
      targets = @selection
      link = Dir.pwd
    elsif Array(src).one?
      print "Link from: "
      link ||= gets # TODO
    end
  
    FileUtils.ln_s targets, link, force: force, noop: noop, verbose: verbose
  end
  
  def ln_sf(targets, dir, noop: nil, verbose: nil)
    unless targets
      targets = @selection
      link = Dir.pwd
    elsif Array(src).one?
      print "Link from: "
      link ||= gets # TODO
    end
  
    FileUtils.ln_sf targets, link, noop: noop, verbose: verbose
  end
  
  
  def install(
    src, dest, mode: nil, owner: nil, group: nil, preserve: nil, noop: nil, verbose: nil
  )
    unless src
      scr = @selection
      dest = Dir.pwd
    elsif Array(src).one?
      print "Install to: "
      dest ||= gets # TODO
    end
  
    FileUtils.mv(
      src, dest, mode: mode, owner: owner, group: group, preserve: preserve, noop: noop, verbose: verbose
    )
  end
end
