package main.java.alarm;

import java.io.*;
import java.util.Date;

public class Event implements Serializable {
	private static final long serialVersionUID = 1L;
	private int average;
	private int value;

    private Long timestamp;

    public Event(int average, int value, Long timestamp) {
		this.average = average;
        this.value = value;
        this.timestamp = timestamp;
    }

    public Event(int value, Long timestamp) {
        this.value = value;
        this.timestamp = timestamp;
    }

    public int getAverage() {
		return average;
	}

    public Long getTimestamp() {
        return timestamp;
    }

	public int getValue() {
		return value;
	}

	public byte[] getBytes() {
		byte[] yourBytes = {};
		try {
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			ObjectOutput out = new ObjectOutputStream(bos);
			out.writeObject(this);
			yourBytes = bos.toByteArray();
			out.close();
			bos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return yourBytes;
	}
}