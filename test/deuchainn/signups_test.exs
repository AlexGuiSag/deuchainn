defmodule Deuchainn.SignupsTest do
  use Deuchainn.DataCase

  alias Deuchainn.Signups

  describe "tweets" do
    alias Deuchainn.Signups.Tweet

    @valid_attrs %{adress: "some adress", twitter: "some twitter", user: "some user"}
    @update_attrs %{adress: "some updated adress", twitter: "some updated twitter", user: "some updated user"}
    @invalid_attrs %{adress: nil, twitter: nil, user: nil}

    def tweet_fixture(attrs \\ %{}) do
      {:ok, tweet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Signups.create_tweet()

      tweet
    end

    test "list_tweets/0 returns all tweets" do
      tweet = tweet_fixture()
      assert Signups.list_tweets() == [tweet]
    end

    test "get_tweet!/1 returns the tweet with given id" do
      tweet = tweet_fixture()
      assert Signups.get_tweet!(tweet.id) == tweet
    end

    test "create_tweet/1 with valid data creates a tweet" do
      assert {:ok, %Tweet{} = tweet} = Signups.create_tweet(@valid_attrs)
      assert tweet.adress == "some adress"
      assert tweet.twitter == "some twitter"
      assert tweet.user == "some user"
    end

    test "create_tweet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Signups.create_tweet(@invalid_attrs)
    end

    test "update_tweet/2 with valid data updates the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{} = tweet} = Signups.update_tweet(tweet, @update_attrs)
      assert tweet.adress == "some updated adress"
      assert tweet.twitter == "some updated twitter"
      assert tweet.user == "some updated user"
    end

    test "update_tweet/2 with invalid data returns error changeset" do
      tweet = tweet_fixture()
      assert {:error, %Ecto.Changeset{}} = Signups.update_tweet(tweet, @invalid_attrs)
      assert tweet == Signups.get_tweet!(tweet.id)
    end

    test "delete_tweet/1 deletes the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{}} = Signups.delete_tweet(tweet)
      assert_raise Ecto.NoResultsError, fn -> Signups.get_tweet!(tweet.id) end
    end

    test "change_tweet/1 returns a tweet changeset" do
      tweet = tweet_fixture()
      assert %Ecto.Changeset{} = Signups.change_tweet(tweet)
    end
  end
end
